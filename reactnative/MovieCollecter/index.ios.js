/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */
'use strict';

var React = require('react');
var ReactNative = require('react-native');
var {
  AppRegistry,
  NavigatorIOS,
  StyleSheet,
} = ReactNative;

//var SearchScreen = require('./SearchScreen');

class MovieCollecter extends React.Component {
  render() {
    return (
      <NavigatorIOS
        style={styles.container}
        initialRoute={{
          title: 'Movies Collecter',
          //component: SearchScreen,
        }}
      />
    );
  }
}
 
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
  },
});

AppRegistry.registerComponent('MovieCollecter', () => MovieCollecter);
module.exports = MovieCollecter;

