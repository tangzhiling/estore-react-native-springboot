import { StyleSheet, Text, View, SafeAreaView, Image, KeyboardAvoidingView, TextInput, Pressable, TouchableOpacity } from 'react-native'
import React, { useState } from 'react';
import { FontAwesome } from '@expo/vector-icons';
import { AntDesign } from '@expo/vector-icons';
import { MaterialIcons } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';

const RegisterPage = () => {

  const [user, setUser] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigation = useNavigation();
  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: "white", alignItems: "center" }}>

      <KeyboardAvoidingView>
        <View style={{ alignItems: "center", marginTop: 100 }}>
          <Text style={{
            fontSize: 40,
            fontWeight: "bold",
            marginTop: 12,
            color: "#041E42"
          }}>请注册</Text>
        </View>

        <View style={{ marginTop: 60 }}>
          <View
            style={{
              flexDirection: "row",
              alignItems: "center",
              gap: 10,
              backgroundColor: "#D0D0D0",
              paddingVertical: 5,
              borderRadius: 5,
            }}
          >
            <FontAwesome style={{ marginLeft: 8, color: "gray" }} name="user" size={24} color="black" />
            <TextInput
              value={user}
              onChangeText={(text) => setUser(text)}

              style={{
                color: "gray",
                marginVertical: 5,
                width: 200,
              }}
              placeholder="输入用户名"
            />
          </View>
        </View>

        <View>
          <View
            style={{
              flexDirection: "row",
              alignItems: "center",
              gap: 10,
              backgroundColor: "#D0D0D0",
              paddingVertical: 5,
              borderRadius: 5,
              marginTop: 20
            }}

          >
            <MaterialIcons style={{ marginLeft: 8, color: "gray" }} name="email" size={24} color="gray" />
            <TextInput
              value={email}
              onChangeText={(text) => setEmail(text)}

              style={{
                color: "gray",
                marginVertical: 5,
                width: 200
              }}
              placeholder="输入电子邮件"
            />
          </View>
        </View>

        <View style={{ marginTop: 1 }}>
          <View
            style={{
              flexDirection: "row",
              alignItems: "center",
              gap: 10,
              backgroundColor: "#D0D0D0",
              paddingVertical: 5,
              borderRadius: 5,
              marginTop: 20
            }}
          >

            <AntDesign style={{ marginLeft: 8, color: "gray" }} name="lock" size={24} color="black" />
            <TextInput
              value={password}
              onChangeText={(text) => setPassword(text)}
              secureTextEntry={true}
              style={{
                color: "gray",
                marginVertical: 5,
                width: 200
              }}
              placeholder="输入密码"
            />

          </View>

        </View>


        <TouchableOpacity
          onPress={() => { }}
          style={{
            backgroundColor: "#4682B4",
            padding: 20,
            borderRadius: 6,
            marginTop: 30
          }}
        >
          <Text style={{ textAlign: "center", fontSize:16, color: "white" }}>注册</Text>
        </TouchableOpacity>

        <Pressable
          onPress={() => navigation.goBack()}
          style={{ marginTop: 15 }}
        >
          <Text style={{ textAlign: "center", color: "gray", fontSize: 16 }}>
            已经有账户，返回登录
          </Text>
        </Pressable>


      </KeyboardAvoidingView>


    </SafeAreaView>
  );
};

export default RegisterPage;

const styles = StyleSheet.create({});