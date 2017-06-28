/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import Toast, {DURATION} from 'react-native-easy-toast'
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Dimensions,
  Animated,
  TouchableHighlight
} from 'react-native';

// export const DURATION = { 
//     LENGTH_LONG: 2000, 
//     LENGTH_SHORT: 500,
//     FOREVER: 0,
// };

const {height, width} = Dimensions.get('window');

export default class AdTest extends Component {

  constructor(props) {
        super(props);
        this.state = {
            position: 'bottom',
            style:{},
        }
    }

   onClick(text, position, duration,withStyle) {
        this.setState({
            position: position,
        })
        if(withStyle){
            this.refs.toastWithStyle.show(text, duration);
        }else {
            this.refs.toast.show(text, duration);
        }
    }

getButton(text, position, duration,withStyle) {
        return(
            <TouchableHighlight
                style={{padding: 10}}
                onPress={()=>this.onClick(text, position, duration,withStyle)}>
                <Text>{text}</Text>
            </TouchableHighlight>
        )
    }

  render() {
    return(
      <View style={styles.container}>
                {this.getButton('LENGTH_SHORT+top', 'top', DURATION.LENGTH_SHORT)}
                {this.getButton('LENGTH_SHORT+bottom', 'bottom', DURATION.LENGTH_SHORT)}
                {this.getButton('LENGTH_LONG+top', 'top', DURATION.LENGTH_LONG)}
                {this.getButton('LENGTH_LONG+bottom', 'bottom', DURATION.LENGTH_LONG)}
                {this.getButton('LENGTH_LONG+bottom+custom style', 'bottom', DURATION.LENGTH_LONG,true)}
                <Toast ref="toast" position={this.state.position}/>
                <Toast ref="toastWithStyle" style={{backgroundColor:'red'}} position={this.state.position}/>
            </View>
      );
  }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
});
AppRegistry.registerComponent('AdTest', () => AdTest);
