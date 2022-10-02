/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  useColorScheme,
  View,
  NativeModules,
  Button,
} from 'react-native';

const {DynamicIslandModule} = NativeModules;
import {Colors, Header} from 'react-native/Libraries/NewAppScreen';

const App = () => {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  const onPressTestFunc = () => {
    DynamicIslandModule.testFunc('Hello', 'Words!').then(response => {
      console.log('res: ', response);
    });
  };

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
              DynamicIslandModule.startNotificationActivity(
                'Hoà Phan Dev',
                'Welcome My Chanel!',
              )
            }
          />
          <Button
            title="Update Activity"
            onPress={() =>
              DynamicIslandModule.updateNotificationActivity(
                'Share programming experience!',
              )
            }
          />
          <Button
            title="End Activity"
            onPress={() => DynamicIslandModule.endNotificationActivity()}
          />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;
