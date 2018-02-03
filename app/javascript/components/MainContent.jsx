import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import classNames from 'classnames';
import Typography from 'material-ui/Typography';
import axios from 'axios';

import RecipeReviewCard from './RecipeReviewCard';
import Footer from '../components/Footer';

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
  card: {
    marginBottom: 20,
  },
});

class MainContent extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      jokes: []
    }
  }

  componentDidMount() {
    axios.get('/jokes/list',{
      responseType: 'json'
    })
    .then(res => {
      const jokes = res.data.jokes;
      this.setState({ jokes });
    })
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
            classes={{
              card: classes.card,
            }}
            key={index}
            joke={joke}
          />
        ))}
        <Footer />
      </main>
    )
  }
}

MainContent.propTypes = {
  classes: PropTypes.object.isRequired,
  theme: PropTypes.object.isRequired,
};

export default withStyles(styles, { withTheme: true })(MainContent);