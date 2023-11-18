

import React, { useContext } from 'react';
import { View, Text, StyleSheet } from 'react-native';

import { CartContext } from '../CartContext.js';

export function CartIcon({navigation}) {
  const {getItemsCount} = useContext(CartContext);
  return (
    <View style={styles.container}>
      <Text style={styles.text} 
        onPress={() => {
          navigation.navigate('Cart');
        }}
      >购物车 ({getItemsCount()})</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    marginHorizontal: 30,
    backgroundColor: 'orange',
    height: 38,
    padding: 12,
    borderRadius: 32 / 2,
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    color: 'white',
    fontWeight: 'bold',
    marginTop: -3
  },
});