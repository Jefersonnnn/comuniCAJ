<?php

define('SECURE_KEY','aguas');//Assigned within a config, pref outside of root dir

function encrypt($value){
    $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
    $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
    return mcrypt_encrypt(MCRYPT_RIJNDAEL_256, SECURE_KEY, $value, MCRYPT_MODE_ECB, $iv);
}

function decrypt($value){
    $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
    $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
    return trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, SECURE_KEY, $value, MCRYPT_MODE_ECB, $iv));
}
//Simple usage
//$encryptedString = encrypt('This String Will Be encrypted');
//echo decrypt($encryptedString);