import { View, StyleSheet, Image } from 'react-native';
import React from 'react';
import { SliderBox } from 'react-native-image-slider-box';
import { COLORS, SIZES } from '../constants'


/* const Carousel = () => {
    const slides = [
      
      <Image source={require('../assets/images/fn1.jpg')} />,
      <Image source={require('../assets/images/fn2.jpeg')} />,
      <Image source={require('../assets/images/fn3.jpeg')} />,
      ];
  return (
   
      <View style={styles.carouselContainer}>
      <SliderBox images={slides}
        dotColor={COLORS.primary}
        inactiveDotColor={COLORS.secondary}
        ImageComponentStyle={{borderRadius: 15, width: '93%', marginTop: 15,}}
        autoplay
        circleLoop
        
      />
    
    </View>
  )
} */

export default Carousel;

const styles = StyleSheet.create({
  carouselContainer: {
    flex: 1,
    alignItems: "center",
    
    
  },
});