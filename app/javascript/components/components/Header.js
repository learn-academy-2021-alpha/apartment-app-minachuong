import React, { Component } from 'react'
import { Nav, NavItem } from 'reactstrap'
import { NavLink } from 'react-router-dom'
import apartmentIcon from '../assets/apartment-icon.png'

class Header extends Component {
  render() {
    const {
      logged_in,
      sign_in_route,
      sign_out_route
    } = this.props
    return (
      <div className="header-main">
        <NavLink to="/"><img src={ apartmentIcon } alt="apartment app icon" className="icon" /></NavLink>
        <Nav>
          <NavItem>
            <NavLink to="/">Home</NavLink>
          </NavItem>
          <NavItem>
            <NavLink to="/apartment-index">All the Apartments</NavLink>
          </NavItem>
          <NavItem>
            <NavLink to="#">Another Link</NavLink>
          </NavItem>
          { logged_in &&
            <NavItem>
              <a href={ sign_out_route }>Sign Out</a>
            </NavItem>
          }
          { !logged_in &&
            <NavItem>
              <a href={ sign_in_route }>Sign In</a>
            </NavItem>
          }
        </Nav>
      </div>
    )
  }
}
export default Header
