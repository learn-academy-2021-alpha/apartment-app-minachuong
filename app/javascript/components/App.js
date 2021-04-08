import React, { Component} from 'react'
import Header from './components/Header'
import Home from './pages/Home'
import ApartmentIndex from './pages/ApartmentIndex'
import ApartmentShow from './pages/ApartmentShow'
import ApartmentNew from './pages/ApartmentNew'
import MyApartmentIndex from './pages/MyApartmentIndex'
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

  createNewApartment = (apartment) => {
    console.log(apartment)
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
    console.log("apartments:", apartments)
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
          <Route
            path="/apartment/:id"
            render={ (props) => {
              let id = +props.match.params.id
              let apartment = apartments.find(a => a.id === id)
              return <ApartmentShow apartment={ apartment } />
            }}
          />
          { logged_in &&
            <Route
              path="/myapartments"
              render={ (props) => {
                let myApartments = apartments.filter(apartment => apartment.user_id === current_user.id)
                return <MyApartmentIndex myApartments={ myApartments } />
              }}
            />
          }
          { logged_in &&
            <Route
              path="/new"
              render={ (props) =>
                <ApartmentNew
                  createNewApartment={ this.createNewApartment }
                  current_user={ current_user }
                />
              }
            />
          }
          <Route component={ NotFound } />
        </Switch>
      </Router>
    )
  }
}

export default App
