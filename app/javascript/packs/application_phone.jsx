import 'typeface-roboto'
import Reboot from 'material-ui/Reboot';
import React from 'react';
import { render } from 'react-dom';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import Grid from 'material-ui/Grid';
import PhoneContent from '../components/PhoneContent';
import SimpleBottomNavigation from '../components/SimpleBottomNavigation';

const styles = theme => ({
  wrapper: {
    display: 'flex',
    position: 'relative',
  },
});

class App extends React.Component {
  state = {
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
            <PhoneContent />
            <SimpleBottomNavigation />
          </Grid>
        </Grid>
      </div>
    )
  }
}

const AppStyled = withStyles(styles)(App);

document.addEventListener('DOMContentLoaded', () => {
  render(<AppStyled />, document.querySelector('#app'));
})