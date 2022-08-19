import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, TextInput } from 'react-native';
import MyButton from './components/MyButton';

export default function App() {
    const name = 'My';
    let i = 0;
    const fsize = {
        [`level${++i}`]:5,
        [`level${++i}`]:15,
        [`level${++i}`]:25,
        [`level${++i}`]:35
    }
    const demention = [
        {width:10,height:10},
        {width:20,height:10},
        {width:30,height:10},
        {width:40,height:10}
    ]   
    const update_h = () => {console.log('수정')}
    const save_h = () => {console.log('저장')}
    const list_h = () => {console.log('목록')}
    const delete_h = () => {console.log('삭제')}

    return (
    <View style={styles.container}>
        <View style={{flexDirection:'row', alignItems:'center'}}>
            <Text>아이디</Text>
            <TextInput
                style={styles.input}
            />
        </View>
        <Text style={styles.myfont}>{name} Component</Text>
            <StatusBar style="auto" />
        <View style={styles.container2}>
            <MyButton 
                // title='수정'
                fsize={fsize.level1}
                demention={demention[0]}
                onPress={update_h}    
            >
                수정하기
            </MyButton>
            <MyButton 
                title='저장' 
                fsize={fsize.level2} 
                demention={demention[1]}
                onPress={save_h}
            >
            </MyButton>
            <MyButton 
                title='목록' 
                fsize={fsize.level3} 
                demention={demention[2]}
                onPress={list_h}
            >
            </MyButton>
            <MyButton 
                title='삭제' 
                fsize={fsize.level4} 
                demention={demention[3]}
                onPress={delete_h}
            >
            </MyButton>
            <MyButton>

            </MyButton>
        </View>    
    </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center',
    },

    myfont:{
        fontSize:50,
        backgroundColor:'yellow'
    },

    container2: {
        flexDirection:'row'
    },

    input: {
        height:40,
        margin: 12,
        borderWidth:1,
        padding:10
    }

});
