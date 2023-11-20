import { StyleSheet, Text, View, Image, Alert, Keyboard } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context';
import { COLORS, SIZES } from '../constants';
import { ScrollView } from 'react-native-gesture-handler';
import Input from '../components/auth/input';
import Button from '../components/auth/Button';
import BackButton from '../components/auth/BackButton';
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';

const LoginPage = ({ navigation }) => {
  const [loader, setLoader] = React.useState(false)
  const [responseData, setResponseData] = useState(null);
  const [inputs, setInput] = React.useState({
    email: '',
    password: '',
  });

  const [errors, setErrors] = React.useState({});

  const handleError = (errorMessage, input) => {
    setErrors(prevState => ({ ...prevState, [input]: errorMessage }));
  }


  // INPUT VALIDATION
  const validate = () => {
    Keyboard.dismiss();
    let valid = true;

    if (!inputs.email) {

      handleError("Provide a valid email", 'email');
      valid = false;

    } else if (!inputs.email.match(/\S+@\S+\.\S+/)) {

      handleError('Provide a valid email', 'email');
      valid = false;

    }

    if (!inputs.password) {
      handleError('Please input password', 'password');
      valid = false;
    } else if (inputs.password.length < 8) {
      handleError('密码至少8位', 'password');
      valid = false;
    }

    if (valid) {
      login();
    }
  }

  const login = async () => {
    setLoader(true);
    try {
      const endpoint = 'http://localhost:3000/api/login';
      const data = inputs
      console.log(data);

      const response = await axios.post(endpoint, data);
      setResponseData(response.data);
      console.log(responseData);

      try {
        setLoader(false);
        await AsyncStorage.setItem(`user${responseData._id}`, JSON.stringify(responseData));
        await AsyncStorage.setItem('id', JSON.stringify(responseData._id))
        navigation.replace('Bottom Navigation');
      } catch (error) {
        Alert.alert('Error', 'Oops, something went wrong. Try again');
      }


    } catch (error) {
      Alert.alert('Error', error);
    };


  };

  const handleChanges = (text, input) => {
    setInput(prevState => ({ ...prevState, [input]: text }));
  };

  return (
    <ScrollView>
      <SafeAreaView style={{ marginHorizontal: 20 }}>
        <View>
          <BackButton onPress={() => navigation.goBack()} />

          

          <Text style={styles.motto}>欢迎商城用户</Text>

          <Input
            placeholder="输入电子邮箱"
            icon='email-outline'
            label={'电子邮箱'}
            error={errors.email}
            onFocus={() => {
              handleError(null, 'email');
            }}
            onChangeText={(text) => handleChanges(text, 'email')}
          />

          <Input
            placeholder="输入密码"
            icon='lock-outline'
            label={'密码'}
            error={errors.password}
            onFocus={() => {
              handleError(null, 'password');
            }}
            onChangeText={(text) => handleChanges(text, 'password')}
          />

          <Button title={'登录'} onPress={validate} />
          <Text style={styles.registered} onPress={() => navigation.navigate('Signup')}>
            没有账户？请注册
          </Text>

        </View>
      </SafeAreaView>
    </ScrollView>
  )
}

export default LoginPage

const styles = StyleSheet.create({


  img: {
    height: SIZES.height / 2.4,
    width: SIZES.width - 60,
    resizeMode: "contain",
    marginBottom: SIZES.xxLarge
  },

  motto: {
    fontFamily: 'bold',
    fontSize: SIZES.xLarge,
    color: COLORS.primary,
    textAlign: "center",
    marginBottom: SIZES.large
  },

  registered: {
    marginTop: 10,
    color: COLORS.black,
    textAlign: "center",

  },
})