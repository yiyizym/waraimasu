import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import classNames from 'classnames';
import Drawer from 'material-ui/Drawer';
import List, { ListItem, ListItemIcon, ListItemText } from 'material-ui/List';
import Typography from 'material-ui/Typography';
import { MenuItem } from 'material-ui/Menu';
import Divider from 'material-ui/Divider';
import IconButton from 'material-ui/IconButton';
import MenuIcon from 'material-ui-icons/Menu';
import ChevronLeftIcon from 'material-ui-icons/ChevronLeft';
import ChevronRightIcon from 'material-ui-icons/ChevronRight';
import FavoriteIcon from 'material-ui-icons/Favorite';
import InfoIcon from 'material-ui-icons/Info';
import CreateIcon from 'material-ui-icons/Create';
import Constant from './constant';
import { Link } from 'react-router'

const drawerWidth = 240;

const styles = theme => ({
  drawerPaper: {
    position: 'relative',
    minHeight: '100vh',
    width: drawerWidth,
  },
  drawerHeader: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'space-between',
    padding: '0 8px 0 16px',
    ...theme.mixins.toolbar,
  },
});

class PersistentDrawer extends React.Component {

  render() {
    const { classes, theme, handleDrawerClose } = this.props;
    let { open } = this.props;

    return (
        <Drawer
          type="persistent"
          classes={{
            paper: classes.drawerPaper,
          }}
          anchor="left"
          open={open}
        >
          <div className={classes.drawerInner}>
            <div className={classes.drawerHeader}>
              <Typography type="title" color="inherit" align="center">
                {Constant.mainPage}
              </Typography>
              <IconButton onClick={handleDrawerClose}>
                {theme.direction === 'rtl' ? <ChevronRightIcon /> : <ChevronLeftIcon />}
              </IconButton>
            </div>
            <Divider />
            <List className={classes.list}>
              <ListItem button>
                <Link to="/jokes">
                  <ListItemIcon>
                    <FavoriteIcon />
                  </ListItemIcon>
                  <ListItemText primary={Constant.favorite} />
                </Link>
              </ListItem>
              <ListItem button>
                <Link to="/about">
                  <ListItemIcon>
                    <InfoIcon />
                  </ListItemIcon>
                  <ListItemText primary={Constant.information} />
                </Link>
              </ListItem>
              <ListItem button>
                <ListItemIcon>
                <CreateIcon />
                </ListItemIcon>
                <ListItemText primary={Constant.blog} />
              </ListItem>
            </List>
          </div>
        </Drawer>
    );
  }
}

PersistentDrawer.propTypes = {
  classes: PropTypes.object.isRequired,
  theme: PropTypes.object.isRequired,
};

export default withStyles(styles, { withTheme: true })(PersistentDrawer);