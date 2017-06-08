import React, { Component } from 'react';
import upstairsMap from './upstairsMap.jpg';
// import network from './exampleNetwork.js'
import color from 'color'
// import coordinates from './coordinates.js'

const circleSize = 12
const networkGraphEndpoint = 'http://192.168.254.31:2005/NetworkGraph'
const coordinateEndpoint = 'http://192.168.254.31/coordinates.json'
const refreshInterval = 1000

const makeCoordMap = coordinates => coordinates.reduce((acc, item) => {
  acc[item.id] = item
  return acc
}, {})

const ipToId = ng => {
  const lastOctetRegex = /\.(\d+)$/
  ng.nodes.forEach(node => node.id     = Number(lastOctetRegex.exec(node.id)[1]))
  ng.links.forEach(link => link.source = Number(lastOctetRegex.exec(link.source)[1]))
  ng.links.forEach(link => link.target = Number(lastOctetRegex.exec(link.target)[1]))
}

const joinCoords = (coordMap, ng) => {
  ng.nodes.forEach(node => {
    if (coordMap[node.id]) {
      node.x = coordMap[node.id].x
      node.y = coordMap[node.id].y
    }
  })
}

class App extends Component {
  componentDidMount () {
    const fetchAndUpdate = async () => {
      let req = await fetch(coordinateEndpoint)
      const coordinates = await req.json()
      req = await fetch(networkGraphEndpoint)
      const networkGraph = await req.json()
      this.setState({ networkGraph, coordinates })
    }
    fetchAndUpdate()
    setInterval(fetchAndUpdate, refreshInterval)
  }

  render() {
    const ng = this.state && this.state.networkGraph
    const coords = this.state && this.state.coordinates
    if (ng && coords) {
      console.log('foooOOOOOO', ng, coords)
      const coordMap = makeCoordMap(coords)
      ipToId(ng)
      joinCoords(coordMap, ng)

      return (
        <div className="App">
          <img src={upstairsMap} style={{
            width: 1000,
            position: 'absolute',
            top: 0,
            left: 0
          }}/>
          <svg style={{
            width: 1000,
            height: 1000,
            position: 'absolute',
            top: 0,
            left: 0
          }}>
          {ng.links.map(({ source, target, cost }) => {
            const alpha = (6 - cost) / 10
            return coordMap[source] && coordMap[target] && <path
              d={[
                `M ${coordMap[source].x} ${coordMap[source].y}`,
                `L ${coordMap[target].x} ${coordMap[target].y}`
              ]}
              stroke={color('yellow').mix(color('purple'), cost / 5)}
              opacity={0.5}
              strokeWidth={6 - cost}
              fill="none"
            />
          })}
          {ng.nodes.map(({ x, y, id }) =>
            coordMap[id] && <g transform={`translate(${x}, ${y})`}>
              <g transform={`translate(-12, -12)`}>
                <circle id="Oval" stroke="#000000" fill="#F00" cx={circleSize} cy={circleSize} r={circleSize}></circle>
                <text id="15" fontFamily="Arial-BoldMT, Arial" fontSize="14" fontWeight="bold" fill="#FFFFFF">
                  <tspan x="3" y="17">{id}</tspan>
                </text>
              </g>
            </g>
          )}
          </svg>
        </div>
      );
    } else {
      return <div>Could not load</div>
    }
  }
}

export default App;