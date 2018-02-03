import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import classNames from 'classnames';


const styles = theme => ({
  footer: {
    width: '100%',
    textAlign: 'center',
  },
  'link:active': {
    textDecoration: 'none',
  },
  link: {
    color: 'rgba(0,0,0,.54)',
    fontSize: 12,
    textDecoration: 'none'
  }
});

class Footer extends React.Component {

  render() {
    const { classes, theme } = this.props;

    return (
      <footer
        className={classes.footer}
      >
        <a
          className={classes.link}
        href="http://www.miibeian.gov.cn/" target="_blank" rel="nofollow">粤ICP备18006426号</a>
      </footer>
    );
  }
}

Footer.propTypes = {
  classes: PropTypes.object.isRequired,
  theme: PropTypes.object.isRequired,
};

export default withStyles(styles, { withTheme: true })(Footer);