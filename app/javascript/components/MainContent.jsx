import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import classNames from 'classnames';
import Typography from 'material-ui/Typography';

import RecipeReviewCard from './RecipeReviewCard';

const drawerWidth = 240;

const styles = theme => ({
  content: {
    width: '100%',
    flexGrow: 1,
    backgroundColor: theme.palette.background.default,
    padding: theme.spacing.unit * 3,
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
    overflowY: 'scroll',
    height: 'calc(100vh - 56px)',
    maxHeight: 'calc(100vh - 56px)',
    marginTop: 56,
    [theme.breakpoints.up('sm')]: {
      content: {
        height: 'calc(100% - 64px)',
        marginTop: 64,
      },
    },
  },
  'content-left': {
    marginLeft: -drawerWidth,
  },
  contentShift: {
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.easeOut,
      duration: theme.transitions.duration.enteringScreen,
    }),
  },
  'contentShift-left': {
    marginLeft: 0,
  },
});

class MainContent extends React.Component {

  state = {
    jokes: ['1','2','3','4','5','6','7','8']
  }

  render () {
    const { classes } = this.props;
    const { jokes } = this.state;
    let { open } = this.props;
    return (
      <main
        className={classNames(classes.content, classes['content-left'], {
          [classes.contentShift]: open,
          [classes['contentShift-left']]: open,
        })}
      >
        {jokes.map((joke, index) => (
          <RecipeReviewCard
            key={index}
            text={joke}
          />
        ))}
      </main>
    )
  }
}

MainContent.propTypes = {
  classes: PropTypes.object.isRequired,
  theme: PropTypes.object.isRequired,
};

export default withStyles(styles, { withTheme: true })(MainContent);