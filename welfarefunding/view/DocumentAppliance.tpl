<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    </head>
    <style>
        {{{font}}}
        @media print {
            @page{
                size: A4;
                margin-top: .5cm;
                margin-left: 1.5cm;
                margin-right: 1cm;
                margin-bottom: 1.5cm;
            }
            .new-page{
                page-break-before: always !important;
                page-break-inside: avoid;
                clear: both !important;				
            }
            .document{
                width: unset;
                margin: 0;
            }
            *{
                -webkit-print-color-adjust: exact !important;
                color-adjust: exact !important;
                print-color-adjust: exact !important;
            }
        }
        *{
            font-family: 'THSarabunPSK' !important;
            box-sizing: border-box !important;
            margin: 0;
            padding: 0;
            border-color: #000;
            border-width: 1px;
        }
        {{{css}}}
        .document{
            font-size: 16pt;
            page-break-after: always !important;
            height: 27.7cm;
            width: 18.5cm;
            position: relative;
            margin: auto;
        }
        .tab-size-2cm5mm.ql-editor{
            tab-size: 2.5cm;
        }
        .ql-editor{
            overflow: hidden !important;
        }
        .header{
            width: 100%;
            font-size: 14pt;
            position: relative;
        }
        .head{
            padding-top: 1cm;
            font-size: 20pt;
            text-align: center;
            font-weight: bold;
        }
        .footer{
            position: absolute;
            bottom: 0;
            width: 100%;
            font-size: 14pt;
        }
        .topic{
            font-weight: 600; 
            color: black; 
            text-align: center;
        }
        .billWelfare table{
            display: table;
            border-collapse: collapse;
            box-sizing: border-box;
            text-indent: initial;
            border-spacing: 2px;
            font-size: .9em;
            border: solid 1px;
            width: 100%;
        }
        .billWelfare th{
            border: 1px solid black;
            padding: 5px;
            text-align: center;
        }
        .billWelfare thead{
            display: table-header-group;
            vertical-align: middle;
            border-color: inherit;
            border: 1px solid;
        }
        .billWelfare td{
            border: 1px solid black;
            padding: 5px;
            text-align: center;
        }
        .billWelfare .order{
            width: 50pt;
        }
        .billWelfare .amount1{
            width: 80pt;
        }
        .billWelfare .amount2{
            width: 30pt;
        }

        .billWelfare tr{
            height: 25pt;
        }
        .line{
            border-bottom: solid 0.5pt;
            text-align: center;
        }
        .topic{
            font-weight: 600; 
            color: black; 
            text-align: center;
        }
    </style>
    <body>
        <div class="document">
            {{thaibaht_text}}
            <div class="topic">ใบสำคัญจ่ายเงิน</div>
            <div style="text-align: center;">
                <div style="margin-top: 10pt; display: flex; justify-content: center;">กองทุนสวัสดิการชุมชน<div class="line" style="width: 20%;">ตำบลทรัพย์อนันต์</div></div>
                <div style="margin-top: 5pt; display: flex; justify-content: center;">
                    เลขที่<div class="line" style="width: 10%;">119</div>ถนน<div class="line" style="width: 10%;">-</div>
                    ตำบล<div class="line" style="width: 15%;">ทรัพย์อนนันต์</div>อำเภอ<div class="line" style="width: 10%;">ท่าเเซะ</div>
                    จังหวัด<div class="line" style="width: 10%;">ชุมพร</div>
                </div>
            </div>
            <div style="display: flex; margin-top: 5pt; width: 100%; margin-left: 55%; margin-top: 10pt;">วัน<div class="line" style="width: 10%;">{{{date}}}</div>เดือน<div class="line" style="width: 15%;">{{{month}}}</div>ปี<div class="line" style="width: 10%;">{{{year}}}</div></div>
            <div style="text-align: center;">
                <div style="display: flex; width: 100%; justify-content: center;">ข้าพเจ้า<div class="line" style="width: 40%;">{{{member.firstName}}} {{{member.lastName}}}</div></div>
                <!-- <div>ที่อยู่เลขที่......... หมู่ที่......... ตรอก/ถนน......... ตำบล.........
                อำเภอ......... จังหวัด......... โทร.........</div> -->
                <div style="display: flex; width: 100%; justify-content: center;">ได้รับเงินจาก<div class="line" style="width: 30%;">{{roleAudit.firstName}}  {{roleAudit.lastName}}</div></div>
                <div style="font-weight: 600; margin-top: 20pt;">ตามรายละเอียดดังนี้</div>
            </div>
            <div class="billWelfare">
                <table>
                    <thead>
                        <tr>
                            <th>ลำดับที่</th>
                            <th>รายการ</th>
                            <th colspan="2">จำนวนเงิน</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="order">1</td>
                            <td style="text-align: start;">จ่ายสวัสดิการให้กับสมาชิก</td>
                            <td class="amount1">{{{Amount}}}</td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td class="order">2</td>
                            <td></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td class="order">3</td>
                            <td></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td class="order">4</td>
                            <td></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td class="order">5</td>
                            <td></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td class="order">6</td>
                            <td></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td class="order">7</td>
                            <td></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td class="order">8</td>
                            <td></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td class="order">9</td>
                            <td></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td class="order">10</td>
                            <td></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr>
                        <tr>
                            <td colspan="2">รวมทั้งสิ้น</td>
                            <td class="amount1">{{{Amount}}}</td>
                            <td class="amount2"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="display: flex; text-align: center; margin-top: 20pt; justify-content: center;">ตัวอักษร<div class="line" style="width: 60%;">({{{expenseAmountText}}})</div></div>
            <div>
                <!-- <div style="display: flex; justify-content: space-around; margin-top: 50pt;">
                    <div style="display: flex; width: 50%; flex-direction: column;">
                        <div style="display: flex; justify-content: center; width: 100%;">ลงชื่อ<div class="line" style="width: 50%;">{{{memberID.firstName}}} {{{memberID.lastName}}}</div>ผู้รับเงิน</div>
                        <div style="display: flex; justify-content: center; width: 100%;">(<div class="line" style="width: 40%;">{{{memberID.firstName}}} {{{memberID.lastName}}}</div>)</div>
                    </div>
                    <div style="text-align: center;">
                        ลงชื่อ............................................................ผู้จ่ายเงิน
                        <br>(.........................................)
                    </div>
                </div> -->
                <div style="display: flex; flex-direction: row; justify-content: space-around;">
                    <div style="width: 100%;">
                        <div style="display: flex; width: 100%; margin-top: 50pt; justify-content: center;">ลงชื่อ<div class="line" style="width: 60%;"></div>ผู้รับเงิน</div>
                        <div style="width: 100%; display: flex; justify-content: center; margin-top: 5pt;">(<div class="line" style="width: 30%;">{{{member.firstName}}} {{{member.lastName}}}</div>)</div>
                    </div>
                    <div style="width: 100%;">
                        <div style="display: flex; width: 100%; margin-top: 50pt; justify-content: center;">ลงชื่อ<div class="line" style="width: 60%;"></div>ผู้จ่ายเงิน</div>
                        <div style="width: 100%; display: flex; justify-content: center; margin-top: 5pt;">(<div class="line" style="width: 30%;">{{roleAudit.firstName}}  {{roleAudit.lastName}}</div>)</div>
                    </div>
                </div>
                <div style="display: flex; width: 100%; margin-top: 50pt; justify-content: center;">ลงชื่อ<div class="line" style="width: 30%;"></div>พยาน</div>
                <div style="width: 100%; display: flex; justify-content: center; margin-top: 5pt;">(<div class="line" style="width: 40%;">{{rolenamechairman.firstName}}  {{rolenamechairman.lastName}}</div>)</div>
            
            </div>
        </div>  
    </body>
</html>