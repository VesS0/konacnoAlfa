<!-- ok-->
<div class="st-content-inner">
    <div class="container">
        <div class="timeline-block">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="media">
                        <div class="media-body">
                            <h5>Pretraga clanova</h5>
                        </div>
                    </div>
                </div>
                <div class="view-all-comments">
                            <span>
                                <?php if(count ($clan)==1)
                                    echo '1 clan';
                                else if(count($clan)<5 and count($clan)>1)
                                    echo (count($clan)-1).' clana';
                                else
                                    echo (count ($clan)-1).' clanova'; ?>
                                </span>
                </div>
                <ul class="comments"  >
                    <?php foreach ($clan as $cl): if($cl['idClan']!=$myID){?>

                        <li class="media" >
                            <div class="media-left">
                                <a onclick="getSummary('<?php echo site_url('user/get_clan_profil')?>/<?php echo $cl['idClan']?>', '<?php echo $cl['ime']?> <?php echo $cl['prezime']?>')">
                                    <?php
                                    $img =base_url().'img/clan_default.png';
                                    if ($cl['slika']=='d') {
                                        $img =base_url().'/img/clan/clan'.$cl['idClan'].'.jpg?dummy='."<?php echo random_int(0,10000)?>";
                                    }?>
                                    <img src="<?php echo $img?>" class="media-object" width="60" height="60"/>
                                </a>
                            </div>

                            <div class="media-body">
                                <a class="comment-author pull-left"
                                   onclick="getSummary('<?php echo site_url('user/get_clan_profil')?>/<?php echo $cl['idClan']?>', '<?php echo $cl['ime']?> <?php echo $cl['prezime']?>')">
                                    <?php echo $cl['ime']?> <?php echo $cl['prezime']?>
                                </a>
                                <div class="pull-right dropdown" >
                                    <a onclick="getSummary('<?php echo site_url('user/get_clan_poruke')?>/<?php echo $cl['idClan']?>', '<?php echo $cl['ime']?> <?php echo $cl['prezime']?>')"
                                       class="toggle-button" data-tooltip="tooltip" title="Posalji poruku">
                                        <i class="fa fa-comment fa-lg" aria-hidden="true"></i>
                                    </a>
                                </div>
                            </div>

                        </li>
                    <?php } endforeach;?>
                </ul>
            </div>
        </div>
    </div>
</div>

