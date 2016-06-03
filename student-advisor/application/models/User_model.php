<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model {

    public function __construct()
    {
        $this->load->database();
    }
    public function index()
    {

    }
    public function get_clan($id = FALSE)
    {
        if ($id === FALSE)
        {
            $query = $this->db->get('clan');
            return $query->result_array()[0];
        }

        $query = $this->db->get_where('clan', array('idClan' => $id));
        return $query->row_array();
    }

    public function get_kurs($id = FALSE)
    {
        if ($id === FALSE)
        {
            $query = $this->db->get('kurs');
            return $query->result_array()[0];
        }

        $query = $this->db->get_where('kurs', array('idKurs' => $id));
        return $query->row_array();
    }
    public function get_predavac($idPred = FALSE)
    {
        if ($idPred === FALSE)
        {
            $query = $this->db->get('predavac');
            return $query->result_array()[0];
        }

        $query = $this->db->get_where('predavac', array('idPred' => $idPred));
        return $query->row_array();
    }
    
    public function get_kurs_komentar($id = 1)
    {
        $query = $this->db->query("select p.*, k.* FROM komentar p inner join kurs k on p.idKurs = k.idkurs and p.idKom=?", array($id));
        return $query->row_array();
    }
    public function get_kurs_predavac($idKurs = 1)
    {
        $query = $this->db->query("select p.*, k.* FROM predavac p inner join predaje k on p.idPred = k.idPred and k.idKurs=? ORDER BY p.zvanje DESC", array($idKurs));
        return $query->result_array();
    }
    public function get_clan_komentar($id, $myID)
    {
        $query = $this->db->query("select p.*, k.*, po.tip FROM komentar p inner join clan k left outer join podrzavanje po 
            on p.idClan = k.idClan and p.idKom=? and p.idClan=? and p.idKom=po.idKom", array($id, $myID));
        return $query->row_array();
    }
    public function get_podkomentar($id = 1)
    {
        $query = $this->db->query("select p.*, k.* FROM podkomentar p inner join clan k on p.idClan = k.idClan and p.idKom=?", array($id));
        return $query->result_array();
    }
    public function get_Polozio_clan($id = FALSE)
    {
        if ($id === FALSE)
        {
            $query = $this->db->query("select p.*, k.* FROM polozio p inner join kurs k on p.idKurs = k.idkurs");
            return $query->result_array();
        }

        $query = $this->db->query('select p.*, k.* FROM polozio p inner join kurs k on p.idKurs = k.idkurs AND p.idClan=?',array($id));
        return $query->result_array();
    }
    public function get_Polozio_kurs($id = FALSE)
    {
        if ($id === FALSE)
        {
            $query = $this->db->query("select p.*, k.* FROM polozio p inner join clan k on p.idClan = k.idClan");
            return $query->result_array();
        }

        $query = $this->db->query('select p.*, k.* FROM polozio p inner join clan k on p.idClan = k.idClan AND p.idKurs=?',array($id));
        return $query->result_array();
    }
    public function  get_predaje_kurs($idPred=1)
    {
        $query = $this->db->query('select p.*, k.* FROM predaje p inner join kurs k on p.idKurs = k.idkurs AND p.idPred=?',array($idPred));
        return $query->result_array();
    }
    public function get_kurs_ocena($idClana = 1, $idKursa = 1)
    {
        $query = $this->db->get_where('polozio', array('idClan' => $idClana),array('idKurs'=>$idKursa));
        return $query->row_array();
    }

    public function get_Poslednje_Poruke($id = FALSE) //mozda radi
    {
        if ($id === FALSE) {
            return null;
        }//INNER JOIN `student-advisor-mysql`.clan c on c.idClan=idPosiljalac OR c.idClan=idPrimalac
        $query = $this->db->query("SELECT * FROM `student-advisor-mysql`.poruka 
                                    INNER JOIN `student-advisor-mysql`.clan c on (c.idClan=idPosiljalac and c.idClan!='$id') OR (c.idClan=idPrimalac and c.idClan!='$id')
                                    WHERE idPor IN 
                                    (
                                        SELECT MAX(p.idPor) FROM `student-advisor-mysql`.poruka p
                                        WHERE ((p.idPosiljalac='$id') AND
                                        NOT EXISTS (	SELECT k.idPor
                                                        FROM `student-advisor-mysql`.poruka k
                                                        WHERE k.idPrimalac=p.idPosiljalac AND k.idPosiljalac=p.idPrimalac
                                                        AND k.idPor>p.idPor
                                                    ))
                                        
                                        OR ((p.idPrimalac='$id') AND 
                                                NOT EXISTS 
                                                    ( SELECT k.idPor
                                                        FROM `student-advisor-mysql`.poruka k
                                                        WHERE k.idPosiljalac=p.idPrimalac AND k.idPrimalac=p.idPosiljalac
                                                        AND k.idPor>p.idPor
                                                    )
                                            )
                                        GROUP BY idPosiljalac,idPrimalac                        
                                    )
                                ORDER BY idPor DESC
                                
                       "
            );

        //$query = $this->db->query('select p.*, c.* FROM clan c inner join poruka p on p.idPrimalac = c.idClan AND p.idPosiljalac=?',array($id));
        return $query->result_array();
    }

    public function get_Poruke($id = FALSE, $idSaKim = FALSE)
    {
        if ($id === FALSE || $idSaKim === FALSE)
        {
            $query = $this->db->get('poruka');
            return $query->result_array()[0];
        }
        //potrebno setovati poruku da je procitana kada smo mi primalaci  ulazimo na neprocitanu poruku.
        //Potrebno da neprocitane poruke se prikazuju kao neprocitane samo za onoga ko ih prima ne i onog ko ih salje.
        
        $query= $this->db->query("
                          SELECT p.* FROM poruka p
                           WHERE ((p.idPosiljalac='$id') AND (idPrimalac='$idSaKim'))
                           OR 
                           ((p.idPosiljalac='$idSaKim') AND (p.idPrimalac='$id'))
                           GROUP BY idPosiljalac,idPrimalac 
                           ORDER BY MAX(p.idPor) ASC");

        $this->db->query("UPDATE `student-advisor-mysql`.poruka 
                            SET procitana='d'
                            WHERE idPor=
                                    (
                                        SELECT idPor FROM 
                                        ( 
                                            SELECT MAX(t.idPor) AS idPor
                                            from `student-advisor-mysql`.poruka t
                                            WHERE t.idPrimalac='$id' AND t.idPosiljalac='$idSaKim' AND t.procitana='n'
                                        ) AS D
		                            )");
        //$query = $this->db->query('poruka', array('idPrimalac' => $id && 'idPosiljalac' => $idSaKim || 'idPrimalac' => $idSaKim && 'idPosiljalac' => $id)).orderBy(idPor);
       // $query = $this->db->query("select p.*,c1.*,c2.* FROM poruka p, clan c1, c2 where c1.idClan=? AND c2.idClan=? AND  "
        return $query->result_array();
    }

    //TAMARA ovo nevalja nesto, videti na stranici OOP1 da slike nmze da ucita zbog nekog idClana pogresnog tj nedefinisanog
    public function get_Ocenio_kurs($id)
    {

        $query = $this->db->query("select p.*, k.*
                                    FROM polozio p 
                                    inner join clan k                                   
                                    on p.idClan = k.idClan 
                                    AND (p.zanimljivost OR p.tezina OR p.preporuka OR p.korisnost)
                                    AND p.idKurs=?",array($id));
        return $query->result_array();
    }
    /*TAMARA nznm sta ce podkomentari ovde
    public function get_Komentar_clan($id,$myID)
    {

        $query = $this->db->query("select p.*, k.* , count(pk.redniBroj) as brPodkomentara
                                    FROM  `student-advisor-mysql`.komentar p
                                    inner join `student-advisor-mysql`.kurs k 
                                    on p.idKurs = k.idkurs and p.idClan=?
                                    left outer join `student-advisor-mysql`.podkomentar pk
                                    on p.idKom=pk.idKom
                                    group by p.idKom
                                    ", array($id));
        return $query->result_array();
    }*/
    public function get_Komentar_clan($id,$myID)
    {

        $query = $this->db->query("select p.*, k.*, l.tip
                                    FROM  komentar p
                                    inner join kurs k 
                                    on p.idKurs = k.idkurs and p.idClan=?
                                    left outer join podrzavanje l
                                    on p.idKom=l.idKom and l.idClan=?", array($id,$myID));
        return $query->result_array();
    }

    public function get_Komentar_kurs($id = FALSE)
    {
        if ($id === FALSE)
        {
            $query = $this->db->query("select p.*, k.* FROM komentar p inner join clan k on p.idClan = k.idClan");
            return $query->result_array();
        }

        $query = $this->db->query("select p.*, k.* ,count(pk.redniBroj) as brPodkomentara
                                  FROM komentar p 
                                  inner join clan k 
                                  on p.idClan = k.idClan 
                                  and p.idKurs=?
                                  left outer join podkomentar pk
                                  on p.idKom=pk.idKom
                                  group by p.idKom", array($id));
        return $query->result_array();
    }

    public function get_komentar_predavac($idPred = 1)
    {
        $query = $this->db->query("SELECT p.*, k.ime, c.slika, count(pk.redniBroj) as brPodkomentara
                                    FROM komentar p 
                                    inner join kurs k 
                                    inner join predaje pp 
                                    on p.idKurs = k.idkurs 
                                    AND p.idKurs = pp.idKurs 
                                    AND pp.idPred=?
                                    inner join clan c
                                    on c.idClan=p.idClan
                                    left outer join podkomentar pk
                                    on p.idKom=pk.idKom
                                    group by p.idKom", array($idPred));
        return $query->result_array();
    }

    public function get_pretraga_clan($id ="")
    {
        if ($id === FALSE)
        {
            $query = $this->db->query("SELECT * FROM clan ORDER BY ime, prezime");
            return $query->result_array();
        }
        $query = $this->db->query("SELECT * FROM clan where CONCAT(ime,' ',prezime) LIKE '%".$id."%' ORDER BY ime, prezime");
        return $query->result_array();
    }
    public function get_pretraga_kurs($id ="")
    {
        if ($id === FALSE)
        {
            $query = $this->db->query("SELECT * FROM kurs ORDER BY ime" );
            return $query->result_array();
        }
        $query = $this->db->query("SELECT * FROM kurs where ime LIKE '%".$id."%' ORDER BY ime" );
        return $query->result_array();
    }
    public function get_pretraga_predavac($id ="")
    {
        if ($id =="")
        {
            $query = $this->db->query("SELECT * FROM predavac ORDER BY ime, prezime");
            return $query->result_array();
        }
        $query = $this->db->query("SELECT * FROM predavac where CONCAT(ime,' ',prezime) LIKE '%".$id."%' ORDER BY ime, prezime");
        return $query->result_array();
    }
    /*public function get_kurs($id = FALSE)
    {
        if ($id === FALSE)
        {
            $query = $this->db->query("select p.*, k.* FROM polozio p inner join kurs k on p.idKurs = k.idkurs");
            return $query->result_array();
        }

        $query = $this->db->query('select p.*, k.* FROM polozio p inner join kurs k on p.idKurs = k.idkurs AND p.idClan=?',array($id));
        return $query->result_array();
    }*/
<<<<<<< Updated upstream
    




=======



    public function get_clan_from_username($id)
    {
        $query = $this->db->get_where('clan', array('username' => $id));
        return $query->row_array();
    }
>>>>>>> Stashed changes

    public function get_clan_username($id)
    {
        $query = $this->db->get_where('clan', array('username' => $id));
        return $query->row_array()['idClan'];
    }
<<<<<<< Updated upstream
    public function proveri_banovanje($idClan)
    {

        $query=$this->db->query("SELECT k.*, u.datumBanovanja, u.razlog FROM clan k LEFT OUTER JOIN banovanje u on u.idClan=k.idClan WHERE k.idClan=? ",
            array( $idClan));
        date_default_timezone_set("Europe/Belgrade");
        $sad=date("Y-m-d h:i:s");
        $red=$query->row_array();
        $poc=$red['datumBanovanja'];
        if(!$poc)
            return NAN;

        $tekT=strtotime('+1 day', strtotime($poc));
        //return date("Y-m-d h:i:s",$tekT);
        if($tekT<strtotime($sad))
        {
            $this->db->query("DELETE FROM banovanje WHERE idClan=? ", array($idClan));
            return NAN;
        }
        return $red['razlog'];
=======
    public function put_comment($idClan , $idKurs , $comment, $anonim="false")
    {
        if ($anonim=='false')
            $query = $this->db->query("INSERT INTO komentar(idClan,idKurs,tekst,anonimno) VALUES('$idClan','$idKurs','$comment',0)");
        else
            $query = $this->db->query("INSERT INTO komentar(idClan,idKurs,tekst,anonimno) VALUES('$idClan','$idKurs','$comment',1)");
    }

    public function put_message($id,$idSaKim,$tekst)
    {
        $query = $this->db->query("INSERT INTO poruka(idPosiljalac,idPrimalac,tekst) values('$id','$idSaKim','$tekst')");
    }

    public function put_polozen_kurs($idKurs, $id)
    {
        $query = $this->db->query("INSERT INTO polozio(idClan,idKurs) values('$id','$idKurs')");
    }
    public function del_komentar($idkom)
    {
        $query = $this->db->query("DELETE FROM komentar WHERE idKom='$idkom'");
    }
    public function del_kurs_polozen($idKurs, $idClan)
    {
        $query = $this->db->query("DELETE FROM polozio WHERE idClan='$idClan' AND idKurs='$idKurs'");
>>>>>>> Stashed changes
    }
}