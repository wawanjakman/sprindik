<?php

  $no = 1;
  foreach ($data['dataRefDiklat'] as $refDiklat) {
    ?>
    <tr>
      <td><?php echo $no; ?></td>
      <td><?php echo $refDiklat->keterangan; ?></td>
      <td><?php echo $refDiklat->jadwal; ?></td>
      <td><?php echo $refDiklat->status; ?></td>
      <td class="text-center" style="min-width:230px;">
        <button class="btn btn-warning update-dataRefDiklat" data-id="<?php echo $refDiklat->id; ?>"><i class="glyphicon glyphicon-repeat"></i> Update</button>
        <button class="btn btn-danger konfirmasiHapus-refDiklat" data-id="<?php echo $refDiklat->id; ?>" data-toggle="modal" data-target="#konfirmasiHapus"><i class="glyphicon glyphicon-remove-sign"></i> Delete</button>
      </td>
    </tr>
    <?php
    $no++;
  }
?>