import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import classNames from 'classnames';
import Typography from 'material-ui/Typography';
import axios from 'axios';

import RecipeReviewCard from './RecipeReviewCard';

const styles = theme => ({
  content: {
    width: '100%',
    flexGrow: 1,
    display: 'flex',
    flexDirection: 'column',
    backgroundColor: theme.palette.background.default,
    padding: theme.spacing.unit * 3,
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
    overflowY: 'scroll',
    height: 'calc(100vh - 56px)',
    maxHeight: 'calc(100vh - 56px)',
    marginBottom: 56,
  },
  card: {
    marginBottom: 15,
  },
});

class MainContent extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      jokes: []
    }
  }

  componentDidMount() {
    axios.get('/jokes/list', {
      responseType: 'json'
    })
      .then(res => {
        const jokes = res.data.jokes;
        this.setState({ jokes });
      })
  }

  render() {
    const { classes } = this.props;
    const { jokes } = this.state;
    return (
      <main
        className={classes.content}
      >
        {jokes.map((joke, index) => (
          <RecipeReviewCard
            classes={{
              card: classes.card,
            }}
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