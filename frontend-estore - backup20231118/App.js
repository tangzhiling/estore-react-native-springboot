//import { StatusBar } from 'expo-status-bar';

/*
export default function App() {
  return (
    <>
        <StackNavigator></StackNavigator>
    </>
  );
}
*/
/*
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
*/
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { NavigationContainer } from '@react-navigation/native';
import { ProductsList } from './screens/ProductsList.js';
import { ProductDetails } from './screens/ProductDetails.js';
import { Cart } from './screens/Cart.js';
import { CartIcon } from './components/CartIcon.js';
import { CartProvider } from './CartContext.js';
import LoginScreen from './screens/Login.js';
import RegisterScreen from './screens/Register.js';
import StackNavigator from './navigation/StackNavigator';

const Stack = createNativeStackNavigator();

function App() {
  return (
    /* { <CartProvider>
      <NavigationContainer>
        <Stack.Navigator>

          <Stack.Screen name='Login' component={LoginScreen} options={{ headerShown: false }} />
          <Stack.Screen name='Register' component={RegisterScreen} options={{ headerShown: false }} />
          <Stack.Screen name='Products' component={ProductsList}
            options={({ navigation }) => ({
              title: '商品列表',
              headerTitleStyle: styles.headerTitle,
              headerRight: () => <CartIcon navigation={navigation} />
            })} />
          <Stack.Screen name='ProductDetails' component={ProductDetails}
            options={({ navigation }) => ({
              title: 'Product 商品详情',
              headerTitleStyle: styles.headerTitle,
              headerRight: () => <CartIcon navigation={navigation} />,
            })} />
          <Stack.Screen name='Cart' component={Cart}
            options={({ navigation }) => ({
              title: '购物车',
              headerTitleStyle: styles.headerTitle,
              headerRight: () => <CartIcon navigation={navigation} />,
            })} />
        </Stack.Navigator>
      </NavigationContainer>
    </CartProvider> } */
    <StackNavigator></StackNavigator>

/*     <NavigationContainer>
      <Stack.Navigator>

        <Stack.Screen name='Login' component={LoginScreen} options={{ headerShown: false }} />
        <Stack.Screen name='Register' component={RegisterScreen} options={{ headerShown: false }} />
        
        <Stack.Screen name='Products' component={ProductsList}
          options={({ navigation }) => ({
            title: '商品列表',
            headerTitleStyle: styles.headerTitle,
            headerRight: () => <CartIcon navigation={navigation} />
          })} />
        <Stack.Screen name='ProductDetails' component={ProductDetails}
          options={({ navigation }) => ({
            title: 'Product 商品详情',
            headerTitleStyle: styles.headerTitle,
            headerRight: () => <CartIcon navigation={navigation} />,
          })} />
        <Stack.Screen name='Cart' component={Cart}
          options={({ navigation }) => ({
            title: '购物车',
            headerTitleStyle: styles.headerTitle,
            headerRight: () => <CartIcon navigation={navigation} />,
          })} />

      </Stack.Navigator>
    </NavigationContainer> */



  );
}

const styles = StyleSheet.create({
  headerTitle: {
    fontSize: 20
  }
});

export default App;
