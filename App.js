/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, {useEffect} from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  useColorScheme,
  View,
  NativeModules,
  Button,
  Linking,
  Alert,
} from 'react-native';

const {DynamicIslandModule} = NativeModules;
import {Colors, Header} from 'react-native/Libraries/NewAppScreen';

const App = () => {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  const handlerDeepLink = url => {
    const action = url.replace('dynamicisland://', '');
    DynamicIslandModule.endFoodOrderActivity();
    Alert.alert(action);
  };

  useEffect(() => {
    Linking.getInitialURL()
      .then(url => {
        if (url) {
          handlerDeepLink(url);
        }
      })
      .catch(err => {
        console.warn('An error occurred', err);
      });
    Linking.addEventListener('url', ({url}) => {
      if (url) {
        handlerDeepLink(url);
      }
    });
  }, []);

  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar
        barStyle={isDarkMode ? 'light-content' : 'dark-content'}
        backgroundColor={backgroundStyle.backgroundColor}
      />
      <ScrollView
        contentInsetAdjustmentBehavior="automatic"
        style={backgroundStyle}>
        <Header />
        <View
          style={{
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
          }}>
          <Button
            title="Start Activity"
            onPress={() =>
              DynamicIslandModule.startFoodOrderActivity(
                'Hoà Phan Dev',
                'We are bringing great food directly to your kitchen',
                'https://images.pexels.com/photos/699953/pexels-photo-699953.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              )
            }
          />
          <Button
            title="Update Activity"
            onPress={() =>
              DynamicIslandModule.updateFoodOrderActivity(
                'Food is any substance consumed to provide nutritional support for an organism',
              )
            }
          />
          <Button
            title="End Activity"
            onPress={() => DynamicIslandModule.endFoodOrderActivity()}
          />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;
