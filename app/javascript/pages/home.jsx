/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'typeface-roboto'
import Reboot from 'material-ui/Reboot';
import React from 'react';
import { render } from 'react-dom';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import Grid from 'material-ui/Grid';
import MenuAppBar from '../components/MenuAppBar';
import PersistentDrawer from '../components/PersistentDrawer';
import MainContent from '../components/MainContent';

const styles = theme => ({
  wrapper: {
    display: 'flex',
    position: 'relative',
  },
});

class App extends React.Component {
  state = {
    open: false,
    anchor: 'left',
  };

  handleDrawerOpen = () => {
    this.setState({ open: true });
  };

  handleDrawerClose = () => {
    this.setState({ open: false });
  };

  render() {
    const { classes } = this.props;
    return (
      <div>
        <Reboot />
        <Grid container spacing={0}>
          <Grid
            item
            xs={12}
            className={classes.wrapper}
          >
            <MenuAppBar
              {...this.state}
              handleDrawerOpen={this.handleDrawerOpen}
            ></MenuAppBar>
            <PersistentDrawer
              {...this.state}
              handleDrawerClose={this.handleDrawerClose}
            />
            <MainContent
              {...this.state}
            />
          </Grid>
        </Grid>
      </div>
    )
  }
}

export default withStyles(styles)(App);