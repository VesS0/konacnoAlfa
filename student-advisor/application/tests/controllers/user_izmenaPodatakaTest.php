<?php

/**
 * Created by PhpStorm.
 * User: tamarasekularac
 * Date: 6/20/16
 * Time: 4:37 AM
 */
class user_izmenaPodatakaTest extends TestCase
{
    public function setUp()
    {
        $this->request('POST', "Guest/logovanje_obrada", ['username' => 'isi', 'password' => 'isi1']);
    }
    public function test_izmenaPodataka(){
        $output=$this->request('POST', "User/put_izmena_profila", ['ime' =>'Isidora', 'prezime'=>'Bojovic', 
            'email'=>'isi@gmail.com', 'pol'=>'z','smer'=>'SI', 'godUpis'=>'2015', 'opis'=>'sreca, sreca, radost','datumRodj'=>'1994-04-06']);
        $this->assertContains('sreca, sreca, radost', $output);

    }
}
