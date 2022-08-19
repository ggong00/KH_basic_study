import React from "react";
import {TouchableOpacity, Text, Image} from 'react-native';
import PropTypes from 'prop-types'

const MyButton = (props) => {
    console.log(props)
    return (
        <TouchableOpacity
            style={{
                backgroundColor:'#3498db',
                paddingHorizontal:props.demention.weith,
                paddingVertical:props.demention.height,
                margin:10,
                borderRadius:8
            }}
            
            activeOpacity={0.1}
            onPress={props.onPress} 
        >
            {/* <Image
                style={{width:50,height:50}} 
                source={require('../../assets/icon/icon.png')}
            >
            </Image>        */}
            <Text style={{fontSize:props.fsize}}>
                {props.title ?? props.children}
            </Text>
        </TouchableOpacity>
    )
}

MyButton.defaultProps = {
    demention:{width:10,height:10},
    title:'임시'
}
MyButton.PropTypes = {
    demention: PropTypes.object.isRequired,
    title: PropTypes.string
}

export default MyButton;