import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import LoginScreen from '../screen/LoginScreen';
import RegisterScreen from '../screen/RegisterScreen';
import ProductListScreen from '../screen/ProductListScreen';

const StackNavigator = () => {
    const Stack = createNativeStackNavigator();

    return (
        <NavigationContainer>
            <Stack.Navigator>
                <Stack.Screen name="Login" component={LoginScreen} options={{headerShown:false}}/>
                <Stack.Screen name='Register' component={RegisterScreen} options={{headerShown:false}}/>
                <Stack.Screen name="ProductList" component={ProductListScreen} options={{headerShown:false}}/>

            </Stack.Navigator>
        </NavigationContainer>
    );

  };
  

export default StackNavigator;

const styles = StyleSheet.create({});