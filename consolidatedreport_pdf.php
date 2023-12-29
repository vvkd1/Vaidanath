<?php 
require_once 'global.php';
authentication_print();
require_once(ROOT_CLASSES.'tcpdf/config/lang/eng.php');
require_once(ROOT_CLASSES.'tcpdf/tcpdf.php');

if(!isset($_REQUEST['from_date']) || empty($_REQUEST['from_date']) &&
  !isset($_REQUEST['to_date']) || empty($_REQUEST['to_date']) ) {
  

  $_REQUEST['from_date']=$_REQUEST['to_date']=date('d-m-Y');
 

}

$filter=" for the ".$_REQUEST['from_date']." to ".$_REQUEST['to_date'];

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Check Printing');
$pdf->SetTitle('Sucessfully Printed Reports');
//$pdf->SetSubject('TCPDF Tutorial');
//$pdf->SetKeywords('TCPDF, PDF, example, test, guide');	

// set default header data
$pdf->SetHeaderData('', '', 'Consolidated Cheque Book Print Report '.$filter, '');

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------


// add a page
$pdf->AddPage();

//$pdf->Write(0, 'Sucessfully Printed Reports', '', 0, 'L', true, 0, false, false, 0);

$pdf->SetFont('helvetica', '', 8);

// -----------------------------------------------------------------------------



$searchString = "";
              
if(isset($_REQUEST['searchterm'])&&!empty($_REQUEST['searchterm']))
{
 
    $searchString .= " and cps_book_size = '".$_REQUEST['searchterm']."'";
  
}

if(isset($_REQUEST['ddlAccountType'])&&!empty($_REQUEST['ddlAccountType']))
{
  
    $searchString .= " and cps_tr_code = '".$_REQUEST['ddlAccountType']."'";
    
}
if(isset($_REQUEST['ddlBranchName'])&&!empty($_REQUEST['ddlBranchName']))
{

  
    $searchString .= " and ABS(cps_branchmicr_code) = '".(int)$_REQUEST['ddlBranchName']."'";
    //$sql = "(select id,cps_unique_req, cps_branchmicr_code,cps_account_no,cps_act_name,cps_act_jointname1,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,cps_process_user_id from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." ORDER BY cps_branchmicr_code ASC,cps_tr_code ASC,cps_date ASC)";

     $sql = "select id,cps_unique_req, cps_branchmicr_code,cps_account_no,cps_act_name,cps_act_jointname1,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,cps_process_user_id from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." ORDER BY ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,cps_date ASC, id ASC";

    if($result = $db->get_results($sql)){

                $data = '<table cellpadding="2" cellspacing="0" border="1" width="100%">';

                $branchDetails = $db->get_row("SELECT branch_name from tb_branchdetails where ABS(branch_code)='".(int)$result[0]->cps_branchmicr_code."'");
                if (!empty($branchDetails)&&!empty($branchDetails->branch_name)) {
                  $branch_name = $branchDetails->branch_name;
                } else {
                  $branch_name ="NA";
                }

                $data .= '<tr><td class="thwidthtd" colspan="11" style="font-size:35px;"><b>'.$branch_name.'</b></td></tr>' ;

                $data .='<tr style="font-weight:bold; border:1px solid black;">
                        <td width="6%" class="thwidthth" align="center">Unique Request No.</td>
                        <td width="6%" class="thwidthth" align="center">Branch Code</td>
                        <td width="6%" class="thwidthth" align="center">Acc. Type</td>
                        <td width="12%" class="thwidthth" align="center">Acc. No</td>
                        <td width="8%" class="thwidthth" align="center">Chq. No. From</td>
                        <td width="8%" class="thwidthth" align="center">Chq. No. To</td>                            
                        <td width="6%" class="thwidthth" align="center">No Of Books</td>
                        <td width="6%" class="thwidthth" align="center">Book Size</td>
                        <td width="24%" class="thwidthth" align="center">Name</td>  
                        <td width="8%" class="thwidthth" align="center">Date Of Issue</td>
                        <td width="10%" class="thwidthth" align="center">User Name</td>
                      </tr>' ;

              $savingCountTotalBook=0;
              $savingCountTotalLeaves=0;
              $currentCountTotalBook=0;
              $currentCountTotalLeaves=0;
              $castCreditCountTotalBook=0;
              $castCreditCountTotalLeaves=0;
              $ddCountTotalBook=0;
              $ddCountTotalLeaves=0;         
              $prevTrCode=$result[0]->cps_tr_code;
            foreach($result as $row) {
                      $adminDetails = $db->get_row("SELECT username from tb_printadmin where adminid='".$row->cps_process_user_id."'");
                      if (!empty($adminDetails)&&!empty($adminDetails->username)) {
                        $userName = $adminDetails->username;
                      } else {
                        $userName ="-";
                      }

                        if($prevTrCode!=$row->cps_tr_code){
                            /*if($prevTrCode==10){
                              $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                            }else{
                              $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                            }*/
                  switch ($prevTrCode) {
                            case '10':
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            case '11':
                                       $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            case '12':
                                        $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Pay Order No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$castCreditCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$castCreditCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;

                                      break;
                            case '13':
                                        $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Demand Draft No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$ddCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$ddCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            
                            default:
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b></b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        </tr>' ;
                                      break;
                          }
                           
                        }
                        $data .= '<tr>
                                        <td class="thwidthtd" align="center">'.$row->cps_unique_req.'</td>
                                        <td class="thwidthtd" align="center">'.$row->cps_branchmicr_code.'</td>
                                        <td class="thwidthtd" align="center">'.$row->cps_tr_code.'</td>
                                        <td class="thwidthtd" align="center">'.$row->cps_account_no.'</td>
                                        <td class="thwidthtd" align="center">'.$row->cps_chq_no_from.'</td>
                                        <td class="thwidthtd" align="center">'.$row->cps_chq_no_to.'</td>
                                        <td class="thwidthtd" align="center">'.$row->cps_no_of_books.'</td>
                                        <td class="thwidthtd" align="center">'.$row->cps_book_size.'</td>
                                        <td class="thwidthtd" align="center">'.$row->cps_act_name.'</td>
                                        <td class="thwidthtd" align="center">'.date('d-m-Y', strtotime($row->cps_date)).'</td>
                                        <td class="thwidthtd" align="center">'.$userName.'</td>
                                      </tr>' ;
                        $prevTrCode=$row->cps_tr_code;
                          /*  if($prevTrCode==10){
                              $savingCountTotalBook=$savingCountTotalBook+$row->cps_no_of_books;
                              $savingCountTotalLeaves=$savingCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
                            }else{
                              $currentCountTotalBook=$currentCountTotalBook+$row->cps_no_of_books;
                              $currentCountTotalLeaves=$currentCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
                            }*/

                  switch ($prevTrCode) {
                          case '10':
                                    $savingCountTotalBook=$savingCountTotalBook+(int)$row->cps_no_of_books;
                                    $savingCountTotalLeaves=$savingCountTotalLeaves+((int)$row->cps_no_of_books*(int)$row->cps_book_size);
                                    break;
                          case '11':
                                    $currentCountTotalBook=$currentCountTotalBook+(int)$row->cps_no_of_books;
                                    $currentCountTotalLeaves=$currentCountTotalLeaves+((int)$row->cps_no_of_books*(int)$row->cps_book_size);
                                    break;
                          case '12':
                                    $castCreditCountTotalBook=$castCreditCountTotalBook+(int)$row->cps_no_of_books;
                                    $castCreditCountTotalLeaves=$castCreditCountTotalLeaves+((int)$row->cps_no_of_books*(int)$row->cps_book_size);
                                    break;
                          case '13':
                                    $ddCountTotalBook=$ddCountTotalBook+(int)$row->cps_no_of_books;
                                    $ddCountTotalLeaves=$ddCountTotalLeaves+((int)$row->cps_no_of_books*(int)$row->cps_book_size);
                                    break;
                          
                          default:
                            continue;
                            break;
                        }
                        
            }
             /*if($prevTrCode==10){
                $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                          <td class="thwidthtd" align="center"><b>'.$savingCountTotalBook.'</b></td>
                          <td class="thwidthtd" align="center"><b>'.$savingCountTotalLeaves.'</b></td>
                          <td class="thwidthtd" colspan="3"></td>
                          </tr>' ;
              }else{
                $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                          <td class="thwidthtd" align="center"><b>'.$currentCountTotalBook.'</b></td>
                          <td class="thwidthtd" align="center"><b>'.$currentCountTotalLeaves.'</b></td>
                          <td class="thwidthtd" colspan="3"></td>
                          </tr>' ;
              }*/
              switch ($prevTrCode) {
                            case '10':
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            case '11':
                                       $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            case '12':
                                        $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Pay Order No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$castCreditCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$castCreditCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;

                                      break;
                            case '13':
                                        $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Cash Credit No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$ddCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$ddCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            
                            default:
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b></b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        </tr>' ;
                                      break;
                          }
               $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>'.$branch_name.' Total</b></td>
                          <td class="thwidthtd" align="center"><b>'.($savingCountTotalBook+$currentCountTotalBook+$castCreditCountTotalBook+$ddCountTotalBook).'</b></td>
                          <td class="thwidthtd" align="center"><b>'.($savingCountTotalLeaves+$currentCountTotalLeaves+$castCreditCountTotalLeaves+$ddCountTotalLeaves).'</b></td>
                          <td class="thwidthtd" colspan="3"></td>
                          </tr>' ;
              $data .= '</table>';


    }else{
              $data = '<table cellpadding="2" cellspacing="0" border="1" width="100%">';

                $data .='<tr style="font-weight:bold; border:1px solid black;">
                        <td width="6%" class="thwidthth" align="center">Unique Request No.</td>
                        <td width="6%" class="thwidthth" align="center">Branch Code</td>
                        <td width="6%" class="thwidthth" align="center">Acc. Type</td>
                        <td width="12%" class="thwidthth" align="center">Acc. No</td>
                        <td width="8%" class="thwidthth" align="center">Chq. No. From</td>
                        <td width="8%" class="thwidthth" align="center">Chq. No. To</td>                            
                        <td width="6%" class="thwidthth" align="center">No Of Books</td>
                        <td width="6%" class="thwidthth" align="center">Book Size</td>
                        <td width="24%" class="thwidthth" align="center">Name</td>  
                        <td width="8%" class="thwidthth" align="center">Date Of Issue</td>
                        <td width="10%" class="thwidthth" align="center">User Name</td>
                      </tr>' ;


                $data .= '<tr><td class="thwidthtd" colspan="11" style="font-size:35px;">No data found!</td></tr>' ;
                $data .= '</table>';
    }

}else{

   // $sqlbranch = "(select distinct cps_branchmicr_code from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." ORDER BY cps_branchmicr_code ASC)";

     $sqlbranch = "select distinct ABS(cps_branchmicr_code) as cps_branchmicr_code from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." ORDER BY ABS(cps_branchmicr_code) ASC";


       

 $data ="";
if($resultbranch = $db->get_results($sqlbranch)){
	$totalBook=0;
    $totalLeaves=0;
  foreach ($resultbranch as $rowbranch) {



            $searchStringIndv = $searchString." and ABS(cps_branchmicr_code) = '".(int)$rowbranch->cps_branchmicr_code."'";
           // $sql = "(select id,cps_unique_req, cps_branchmicr_code,cps_account_no,cps_act_name,cps_act_jointname1,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,cps_process_user_id from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchStringIndv." ORDER BY cps_tr_code ASC,cps_date ASC)";

            $sql = "select id,cps_unique_req, cps_branchmicr_code,cps_account_no,cps_act_name,cps_act_jointname1,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,cps_process_user_id from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchStringIndv." ORDER BY ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,cps_date ASC, id ASC";

/*
print_r($sql);
              echo "<br>";
               echo "<br>";
                echo "<br>";*/
            if($result = $db->get_results($sql)){


                        $data .= '<table cellpadding="2" cellspacing="0" border="1" width="100%">';

                        $branchDetails = $db->get_row("SELECT branch_name from tb_branchdetails where ABS(branch_code)='".(int)$result[0]->cps_branchmicr_code."'");
                        if (!empty($branchDetails)&&!empty($branchDetails->branch_name)) {
                          $branch_name = $branchDetails->branch_name;
                        } else {
                          $branch_name ="NA";
                        }

                        $data .= '<tr><td class="thwidthtd" colspan="11" style="font-size:35px;"><b>'.$branch_name.'</b></td></tr>' ;

                        $data .='<tr style="font-weight:bold; border:1px solid black;">
                                <td width="6%" class="thwidthth" align="center">Unique Request No.</td>
                                <td width="6%" class="thwidthth" align="center">Branch Code</td>
                                <td width="6%" class="thwidthth" align="center">Acc. Type</td>
                                <td width="12%" class="thwidthth" align="center">Acc. No</td>
                                <td width="8%" class="thwidthth" align="center">Chq. No. From</td>
                                <td width="8%" class="thwidthth" align="center">Chq. No. To</td>                            
                                <td width="6%" class="thwidthth" align="center">No Of Books</td>
                                <td width="6%" class="thwidthth" align="center">Book Size</td>
                                <td width="24%" class="thwidthth" align="center">Name</td>  
                                <td width="8%" class="thwidthth" align="center">Date Of Issue</td>
                                <td width="10%" class="thwidthth" align="center">User Name</td>
                              </tr>' ;

                $savingCountTotalBook=0;
                $savingCountTotalLeaves=0;
                $currentCountTotalBook=0;
                $currentCountTotalLeaves=0;  
                $castCreditCountTotalBook=0;
                $castCreditCountTotalLeaves=0;
                $ddCountTotalBook=0;
                $ddCountTotalLeaves=0;         
                $prevTrCode=$result[0]->cps_tr_code;
              foreach($result as $row) {
                        $adminDetails = $db->get_row("SELECT username from tb_printadmin where adminid='".$row->cps_process_user_id."'");
                        if (!empty($adminDetails)&&!empty($adminDetails->username)) {
                          $userName = $adminDetails->username;
                        } else {
                          $userName ="-";
                        }

                          if($prevTrCode!=$row->cps_tr_code){
                              /*if($prevTrCode==10){
                                $data .= '<tr style="font-size:30px;">
                                          <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                                          <td class="thwidthtd" align="center"><b>'.$savingCountTotalBook.'</b></td>
                                          <td class="thwidthtd" align="center"><b>'.$savingCountTotalLeaves.'</b></td>
                                          <td class="thwidthtd" colspan="3"></td>
                                          </tr>' ;
                              }else{
                                $data .= '<tr style="font-size:30px;">
                                          <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                                          <td class="thwidthtd" align="center"><b>'.$currentCountTotalBook.'</b></td>
                                          <td class="thwidthtd" align="center"><b>'.$currentCountTotalLeaves.'</b></td>
                                          <td class="thwidthtd" colspan="3"></td>
                                          </tr>' ;
                              }*/
                 switch ($prevTrCode) {
                            case '10':
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            case '11':
                                       $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            case '12':
                                        $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Pay Order No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$castCreditCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$castCreditCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;

                                      break;
                            case '13':
                                        $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Cash Credit No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$ddCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$ddCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            
                            default:
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b></b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        </tr>' ;
                                      break;
                            }
                          }
                          $data .= '<tr>
                                          <td class="thwidthtd" align="center">'.$row->cps_unique_req.'</td>
                                          <td class="thwidthtd" align="center">'.$row->cps_branchmicr_code.'</td>
                                          <td class="thwidthtd" align="center">'.$row->cps_tr_code.'</td>
                                          <td class="thwidthtd" align="center">'.$row->cps_account_no.'</td>
                                          <td class="thwidthtd" align="center">'.$row->cps_chq_no_from.'</td>
                                          <td class="thwidthtd" align="center">'.$row->cps_chq_no_to.'</td>
                                          <td class="thwidthtd" align="center">'.$row->cps_no_of_books.'</td>
                                          <td class="thwidthtd" align="center">'.$row->cps_book_size.'</td>
                                          <td class="thwidthtd" align="center">'.$row->cps_act_name.'</td>
                                          <td class="thwidthtd" align="center">'.date('d-m-Y', strtotime($row->cps_date)).'</td>
                                          <td class="thwidthtd" align="center">'.$userName.'</td>
                                        </tr>' ;
                             
                          $prevTrCode=$row->cps_tr_code;
                      switch ($prevTrCode) {
                          case '10':
                                    $savingCountTotalBook=$savingCountTotalBook+(int)$row->cps_no_of_books;
                                    $savingCountTotalLeaves=$savingCountTotalLeaves+((int)$row->cps_no_of_books*(int)$row->cps_book_size);
                                    break;
                          case '11':
                                    $currentCountTotalBook=$currentCountTotalBook+(int)$row->cps_no_of_books;
                                    $currentCountTotalLeaves=$currentCountTotalLeaves+((int)$row->cps_no_of_books*(int)$row->cps_book_size);
                                    break;
                          case '12':
                                    $castCreditCountTotalBook=$castCreditCountTotalBook+(int)$row->cps_no_of_books;
                                    $castCreditCountTotalLeaves=$castCreditCountTotalLeaves+((int)$row->cps_no_of_books*(int)$row->cps_book_size);
                                    break;
                          case '13':
                                    $ddCountTotalBook=$ddCountTotalBook+(int)$row->cps_no_of_books;
                                    $ddCountTotalLeaves=$ddCountTotalLeaves+((int)$row->cps_no_of_books*(int)$row->cps_book_size);
                                    break;
                          
                          default:
                            continue;
                            break;
                        }
              }
             switch ($prevTrCode) {
                            case '10':
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$savingCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            case '11':
                                       $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$currentCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            case '12':
                                        $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Pay Order No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$castCreditCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$castCreditCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;

                                      break;
                            case '13':
                                        $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Cash Credit No.</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$ddCountTotalBook.'</b></td>
                                        <td class="thwidthtd" align="center"><b>'.$ddCountTotalLeaves.'</b></td>
                                        <td class="thwidthtd" colspan="3"></td>
                                        </tr>' ;
                                      break;
                            
                            default:
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b></b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        </tr>' ;
                                      break;
                          }
              /* $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>'.$branch_name.' Total</b></td>
                          <td class="thwidthtd" align="center"><b>'.($savingCountTotalBook+$currentCountTotalBook).'</b></td>
                          <td class="thwidthtd" align="center"><b>'.($savingCountTotalLeaves+$currentCountTotalLeaves).'</b></td>
                          <td class="thwidthtd" colspan="3"></td>
                          </tr>' ;
              $data .= '</table>';

              $data .= '<table cellpadding="0" cellspacing="0" border="0" width="100%">';
              $data .= '<tr><td style="font-size:35px;"></td></tr>' ;
              $data .= '</table>';

              $totalBook=$totalBook+($savingCountTotalBook+$currentCountTotalBook);
              $totalLeaves=$totalLeaves+($savingCountTotalLeaves+$currentCountTotalLeaves);*/
              $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>'.$branch_name.' Total</b></td>
                          <td class="thwidthtd" align="center"><b>'.($savingCountTotalBook+$currentCountTotalBook+$castCreditCountTotalBook+$ddCountTotalBook).'</b></td>
                          <td class="thwidthtd" align="center"><b>'.($savingCountTotalLeaves+$currentCountTotalLeaves+$castCreditCountTotalLeaves+$ddCountTotalLeaves).'</b></td>
                          <td class="thwidthtd" colspan="3"></td>
                          </tr>' ;
              $data .= '</table>';

              $data .= '<table cellpadding="0" cellspacing="0" border="0" width="100%">';
              $data .= '<tr><td style="font-size:35px;"></td></tr>' ;
              $data .= '</table>';

              $totalBook=$totalBook+($savingCountTotalBook+$currentCountTotalBook+$castCreditCountTotalBook+$ddCountTotalBook);
              $totalLeaves=$totalLeaves+($savingCountTotalLeaves+$currentCountTotalLeaves+$castCreditCountTotalLeaves+$ddCountTotalLeaves);
          }
        }
        	$data .= '<table cellpadding="2" cellspacing="0" border="1" width="100%">';
              $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Bank Total</b></td>
                          <td class="thwidthtd" align="center"><b>'.($totalBook).'</b></td>
                          <td class="thwidthtd" align="center"><b>'.($totalLeaves).'</b></td>
                          <td class="thwidthtd" colspan="5"></td>
                          </tr>' ;
              $data .= '</table>';
      }else{
              $data = '<table cellpadding="2" cellspacing="0" border="1" width="100%">';

                $data .='<tr style="font-weight:bold; border:1px solid black;">
                        <td width="6%" class="thwidthth" align="center">Unique Request No.</td>
                        <td width="6%" class="thwidthth" align="center">Branch Code</td>
                        <td width="6%" class="thwidthth" align="center">Acc. Type</td>
                        <td width="12%" class="thwidthth" align="center">Acc. No</td>
                        <td width="8%" class="thwidthth" align="center">Chq. No. From</td>
                        <td width="8%" class="thwidthth" align="center">Chq. No. To</td>                            
                        <td width="6%" class="thwidthth" align="center">No Of Books</td>
                        <td width="6%" class="thwidthth" align="center">Book Size</td>
                        <td width="24%" class="thwidthth" align="center">Name</td>  
                        <td width="8%" class="thwidthth" align="center">Date Of Issue</td>
                        <td width="10%" class="thwidthth" align="center">User Name</td>
                      </tr>' ;


                $data .= '<tr><td class="thwidthtd" colspan="11" style="font-size:35px;">No data found!</td></tr>' ;
                $data .= '</table>';
    }
  }




	//echo $data;
$pdf->writeHTML($data, true, false, false, false, '');
$pdf->Output('report-'.time().'.pdf', 'I');
//}
?>