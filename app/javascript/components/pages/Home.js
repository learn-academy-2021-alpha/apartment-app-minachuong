import React, { Component } from 'react'
import apartments from '../assets/apartments.jpeg'

class Home extends Component {
  render() {
    return (
      <>
        <img src={ apartments } alt="colorful apartment doors" className="apartment-background" />
      </>
    )
  }
}
export default Home
