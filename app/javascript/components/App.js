import React, { Component} from 'react'
import Header from './components/Header'
import Home from './pages/Home'
import ApartmentIndex from './pages/ApartmentIndex'
import NotFound from './pages/NotFound'
import {
  BrowserRouter as Router,
  Route,
  Switch
} from 'react-router-dom'
import mockApartments from './mockApartments.js'

class App extends Component {
  constructor(props){
    super(props)
    this.state = {
      apartments: mockApartments
    }
  }
  render() {
    const {
      logged_in,
      current_user,
      sign_in_route,
      sign_out_route,
      sign_up_route
    } = this.props
    const { apartments } = this.state
    console.log("logged_in:", logged_in)
    console.log("current user:", current_user)
    return (
      <Router>
        <Header
          logged_in={ logged_in }
          sign_in_route={ sign_in_route }
          sign_out_route={ sign_out_route }
        />
        <Switch>
          <Route exact path="/" component={ Home } />
          <Route path="/apartment-index" render={ (props) => <ApartmentIndex apartments={ apartments } /> } />
          <Route component={ NotFound } />
        </Switch>
      </Router>
    )
  }
}

export default App
