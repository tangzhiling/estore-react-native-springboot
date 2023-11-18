import { StyleSheet, Text, View, Pressable, ScrollView, FlatList} from 'react-native';
import React, {useState,useEffect} from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useNavigation } from '@react-navigation/native';
import { Product } from '../components/Product.js';
import { getProducts } from '../services/ProductsService.js';


export function ProductsList ({navigation}) {

  function renderProduct({item: product}) {
    return (
      <Product {...product} 
      onPress={() => {
        navigation.navigate('ProductDetails', {
          productId: product.id,
        });
      }}
      />
    );
  }
  
  const [products, setProducts] = useState([]);
  
  useEffect(() => {
    setProducts(getProducts());
  });
  
  return (
  
    <FlatList
      style={styles.productsList}
      contentContainerStyle={styles.productsListContainer}
      keyExtractor={(item) => item.id.toString()}
      data={products}
      renderItem={renderProduct}
    />

  );
}

const styles = StyleSheet.create({
  productsList: {
    backgroundColor: '#eeeeee',
  },
  productsListContainer: {
    backgroundColor: '#eeeeee',
    paddingVertical: 8,
    marginHorizontal: 8,
  },
});