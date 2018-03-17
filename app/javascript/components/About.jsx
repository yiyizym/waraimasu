import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import Paper from 'material-ui/Paper';
import classNames from 'classnames';
import Typography from 'material-ui/Typography';

import Footer from '../components/Footer';

import miniCode from '../images/mini_program_code.jpg';

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
  paper: {
    width: '100%',
    padding: '10px'
  }
});

class About extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    const { classes } = this.props;
    let { open } = this.props;
    return (
      <main
        className={classNames(classes.content, classes['content-left'], {
          [classes.contentShift]: open,
          [classes['contentShift-left']]: open,
        })}
      >
        <Paper className={classes.paper}>
          <p>每天 5 条精选笑话。</p>
          <p>欢迎关注公众号： 幽默研究与创作。</p>
          <p>或者用微信扫描下面的二维码，打开小程序：大笑脸。</p>
          <div>
            <img src={miniCode} alt="mini_program_code"/>
          </div>
        </Paper>
        <Footer />
      </main>
    )
  }
}

About.propTypes = {
  classes: PropTypes.object.isRequired,
  theme: PropTypes.object.isRequired,
};

export default withStyles(styles, { withTheme: true })(About);