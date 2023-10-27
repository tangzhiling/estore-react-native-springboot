import { StyleSheet, Text, View, Pressable } from 'react-native';
import React from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useNavigation } from '@react-navigation/native';

const ProductListScreen = () => {

  const navigation = useNavigation();
  return (
    <SafeAreaView>
      <Text style={{ textAlign: "center", marginTop: 30, fontWeight: "bold" }} >ProductList</Text>


      <Pressable onPress={() => navigation.navigate("Login")} style={{ marginTop: 5 }}>
        <Text style={{ marginTop: 700, textAlign: "center", fontSize: 16, color: "gray" }}>没有喜欢的商品，返回首页</Text>
      </Pressable>

    </SafeAreaView>
  )
}

export default ProductListScreen

const styles = StyleSheet.create({})