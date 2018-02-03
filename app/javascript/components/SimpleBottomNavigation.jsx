import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import BottomNavigation, { BottomNavigationAction } from 'material-ui/BottomNavigation';
import HomeIcon from 'material-ui-icons/Home';
import FavoriteIcon from 'material-ui-icons/Favorite';
import InfoIcon from 'material-ui-icons/Info';

const styles = {
  root: {
    position: 'fixed',
    bottom: 0,
    width: '100vw',

  },
};

class SimpleBottomNavigation extends React.Component {
  state = {
    value: 0,
  };

  handleChange = (event, value) => {
    this.setState({ value });
  };

  render() {
    const { classes } = this.props;
    const { value } = this.state;

    return (
      <BottomNavigation
        value={value}
        onChange={this.handleChange}
        showLabels
        className={classes.root}
      >
        <BottomNavigationAction label="首页" icon={<HomeIcon />} />
        <BottomNavigationAction label="收藏" icon={<FavoriteIcon />} />
        <BottomNavigationAction label="关于" icon={<InfoIcon />} />
      </BottomNavigation>
    );
  }
}

SimpleBottomNavigation.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(SimpleBottomNavigation);