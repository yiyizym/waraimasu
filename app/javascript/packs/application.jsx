/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import React from 'react';
import { render } from 'react-dom';
import { Router, Route, hashHistory } from 'react-router';
import Home from '../pages/home';
// import About from '../pages/about';

document.addEventListener('DOMContentLoaded', () => {
  render((
    <Router history={hashHistory}>
      <Route path="/" component="Home"/>
      {/* <Route path="/about" component="About"/> */}
    </Router>
  ),document.querySelector('#app'));
})