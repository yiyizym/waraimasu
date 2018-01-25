import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import classnames from 'classnames';
import Card, { CardContent, CardActions } from 'material-ui/Card';
import IconButton from 'material-ui/IconButton';
import Typography from 'material-ui/Typography';
import FavoriteIcon from 'material-ui-icons/Favorite';
import ShareIcon from 'material-ui-icons/Share';

const styles = theme => ({
  card: {
    
  },
  actions: {
    justifyContent: 'flex-end',
  },
});

class RecipeReviewCard extends React.Component {

  render() {
    const { classes, joke } = this.props;

    return (
      <Card className={classes.card}>
        <CardContent>
          <Typography component="p">
            {joke.content}
          </Typography>
        </CardContent>
        <CardActions 
          disableActionSpacing
          className={classes.actions}
        >
          <IconButton aria-label="Add to favorites">
            <FavoriteIcon />
          </IconButton>
          <IconButton aria-label="Share">
            <ShareIcon />
          </IconButton>
        </CardActions>
      </Card>
    );
  }
}

RecipeReviewCard.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(RecipeReviewCard);