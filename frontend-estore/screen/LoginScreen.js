import { StyleSheet, Text, View, SafeAreaView, Image, KeyboardAvoidingView, TextInput, Pressable, TouchableOpacity } from 'react-native';
import React, { useState } from 'react';
import { FontAwesome } from '@expo/vector-icons';
import { AntDesign } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';


const LoginPage = () => {

    const [user, setUser] = useState("");
    const [password, setPassword] = useState("");
    const navigation = useNavigation();

    /*
    const handleLogin = async () => {
        // 在此处发送请求到后端
        try {
            let response = await fetch('http://localhost/api/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ username, password }),
            });

            if (response.status === 200) {
                // 登录成功
                Alert.alert('登录成功');
            } else {
                // 登录失败
                Alert.alert('登录失败');
            }
        } catch (error) {
            console.error(error);
        }
    };
    */

    return (
        <SafeAreaView style={{ flex: 1, backgroundColor: "white", alignItems: "center" }}>

            <KeyboardAvoidingView>
                <View style={{ alignItems: "center", marginTop: 100 }}>
                    <Text style={{
                        fontSize: 40,
                        fontWeight: "bold",
                        marginTop: 12,
                        color: "#041E42"
                    }}>请登录</Text>
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
                            marginTop: 20
                        }}
                    >
                        <FontAwesome style={{ marginLeft: 8, color: "gray" }} name="user" size={24} color="black" />
                        <TextInput
                            value={user}
                            onChangeText={(text) => setUser(text)}

                            style={{
                                color: "gray",
                                marginVertical: 5,
                                width: 200
                            }}
                            placeholder="用户名"
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
                            placeholder="密码"
                        />

                    </View>

                </View>



                <Pressable
                    onPress={() => navigation.navigate("ProductList")}
                     style={{
                        backgroundColor: "#4682B4",
                        padding: 20,
                        borderRadius: 6,
                        marginTop: 30
                    }}
                >
                    <Text style={{ textAlign: "center", fontSize: 16, color: "white" }}>登录</Text>
                </Pressable>

                <Pressable onPress={() => navigation.navigate("Register")} style={{ marginTop: 5 }}>
                    <Text style={{ marginTop: 15, textAlign: "center", fontSize: 16, color: "gray" }}>没有账户，请注册</Text>
                </Pressable>

            </KeyboardAvoidingView>


        </SafeAreaView>
    );
};

export default LoginPage;

const styles = StyleSheet.create({});