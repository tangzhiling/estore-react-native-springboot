/*
import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import LoginScreen from '../screens/LoginScreen';
import RegisterScreen from '../screens/RegisterScreen';
import ProductListScreen from '../screens/ProductsListScreen';
*/
import { StyleSheet, Text, View } from 'react-native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { NavigationContainer } from '@react-navigation/native';
import { ProductsList } from '../screens/ProductsList.js';
import { ProductDetails } from '../screens/ProductDetails.js';
import { Cart } from '../screens/Cart.js';
import { CartIcon } from '../components/CartIcon.js';
import { CartProvider } from '../CartContext.js';
import LoginScreen from '../screens/Login.js';
import RegisterScreen from '../screens/Register.js';

const StackNavigator = () => {
    const Stack = createNativeStackNavigator();

    return (
        <NavigationContainer>
            <Stack.Navigator>
                <Stack.Screen name='Login' component={LoginScreen} options={{ headerShown: false }} />
                <Stack.Screen name='Register' component={RegisterScreen} options={{ headerShown: false }} />
                <Stack.Screen name='ProductsList' component={ProductsList} options={{ headerTitle: '商品列表', headerShown: true }} />
                <Stack.Screen name='ProductDetails' component={ProductDetails}
                    options={
                        ({ navigation }) => ({
                            title: '商品详情',
                            headerTitleStyle: styles.headerTitle,
                            headerRight: () => <CartIcon navigation={navigation} />,
                        })
                    } />

                <Stack.Screen name='Cart' component={Cart}
                    options={({ navigation }) => ({
                        title: '购物车',
                        headerTitleStyle: styles.headerTitle,
                        headerRight: () => <CartIcon navigation={navigation} />,
                    })} />

            </Stack.Navigator>
        </NavigationContainer>
    );

};


export default StackNavigator;

const styles = StyleSheet.create({});