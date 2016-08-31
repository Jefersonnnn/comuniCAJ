<?php

class zipfile{
    
     var $datasec = array();
     var $ctrl_dir = array();
     var $eof_ctrl_dir = "\x50\x4b\x05\x06\x00\x00\x00\x00";
    
    
     function zipfile ($output_filename = 'archive.zip'){
        
         header('Content-Type: application/x-zip');
         header('Content-Disposition: inline; filename="' . $output_filename . '"');
         header('Expires: 0');
         header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
         header('Pragma: public');
        
         }
    
     function read_File ($file){
        
         if (is_file($file)){
            
             $fp = fopen ($file, 'rb');
             $content = fread ($fp, filesize($file));
             fclose ($fp);
            
             return $content;
            
             }
        
         }
    
     function addFileAndRead ($file){
        
         if (is_file($file))
             $this -> addFile($this -> read_File($file), $file);
        
         }
    
     function unix2DosTime($unixtime = 0){
        
         $timearray = ($unixtime == 0) ? getdate() : getdate($unixtime);
        
         if ($timearray['year'] < 1980){
            
             $timearray['year'] = 1980;
             $timearray['mon'] = 1;
             $timearray['mday'] = 1;
             $timearray['hours'] = 0;
             $timearray['minutes'] = 0;
             $timearray['seconds'] = 0;
            
             }
        
         return (($timearray['year'] - 1980) << 25) | ($timearray['mon'] << 21) | ($timearray['mday'] << 16) |
         ($timearray['hours'] << 11) | ($timearray['minutes'] << 5) | ($timearray['seconds'] >> 1);
        
         }
    
     function addFile($data, $name, $time = 0){
        
         $name = str_replace('\\', '/', $name);
        
         $dtime = dechex($this -> unix2DosTime($time));
         $hexdtime = '\x' . $dtime[6] . $dtime[7]
         . '\x' . $dtime[4] . $dtime[5]
         . '\x' . $dtime[2] . $dtime[3]
         . '\x' . $dtime[0] . $dtime[1];
        
         eval('$hexdtime = "' . $hexdtime . '";');
        
         $fr = "\x50\x4b\x03\x04";
         $fr .= "\x14\x00"; // ver needed to extract
         $fr .= "\x00\x00"; // gen purpose bit flag
         $fr .= "\x08\x00"; // compression method
         $fr .= $hexdtime; // last mod time and date
        
        
         $unc_len = strlen($data);
         $crc = crc32($data);
         $zdata = gzcompress($data);
         $zdata = substr(substr($zdata, 0, strlen($zdata) - 4), 2); // fix crc bug
         $c_len = strlen($zdata);
         $fr .= pack('V', $crc); // crc32
         $fr .= pack('V', $c_len); // compressed filesize
         $fr .= pack('V', $unc_len); // uncompressed filesize
         $fr .= pack('v', strlen($name)); // length of filename
         $fr .= pack('v', 0); // extra field length
         $fr .= $name;
        
         $fr .= $zdata;
        
         $fr .= pack('V', $crc); // crc32
         $fr .= pack('V', $c_len); // compressed filesize
         $fr .= pack('V', $unc_len); // uncompressed filesize
        
        
         $this -> datasec[] = $fr;
         $new_offset = strlen(implode('', $this -> datasec));
        
         $cdrec = "\x50\x4b\x01\x02";
         $cdrec .= "\x00\x00"; // version made by
         $cdrec .= "\x14\x00"; // version needed to extract
         $cdrec .= "\x00\x00"; // gen purpose bit flag
         $cdrec .= "\x08\x00"; // compression method
         $cdrec .= $hexdtime; // last mod time & date
         $cdrec .= pack('V', $crc); // crc32
         $cdrec .= pack('V', $c_len); // compressed filesize
         $cdrec .= pack('V', $unc_len); // uncompressed filesize
         $cdrec .= pack('v', strlen($name)); // length of filename
         $cdrec .= pack('v', 0); // extra field length
         $cdrec .= pack('v', 0); // file comment length
         $cdrec .= pack('v', 0); // disk number start
         $cdrec .= pack('v', 0); // internal file attributes
         $cdrec .= pack('V', 32); // external file attributes - 'archive' bit set
        
        
         $cdrec .= pack('V', $this -> old_offset); // relative offset of local header
         $this -> old_offset = $new_offset;
        
         $cdrec .= $name;
        
         $this -> ctrl_dir[] = $cdrec;
        
         }
    
     function file(){
        
         $data = implode(NULL, $this -> datasec);
         $ctrldir = implode(NULL, $this -> ctrl_dir);
        
         return $data .
         $ctrldir .
         $this -> eof_ctrl_dir .
         pack('v', sizeof($this -> ctrl_dir)) . pack('v', sizeof($this -> ctrl_dir)) . pack('V', strlen($ctrldir)) . pack('V', strlen($data)) . "\x00\x00"; // .zip file comment length
         }
    
    }

?>