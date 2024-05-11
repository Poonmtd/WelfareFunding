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
        .line{
            border-bottom: solid 0.5pt;
            text-align: center;
        }
        .savingTable table{
            display: table;
            border-collapse: collapse;
            box-sizing: border-box;
            text-indent: initial;
            border-spacing: 2px;
            font-size: .9em;
            border: solid 1px;
            width: 100%;
        }

        .savingTable th{
            border: 1px solid black;
            padding: 5px;
        }

        .savingTable thead{
            display: table-header-group;
            vertical-align: middle;
            border-color: inherit;
            border: 1px solid;
            text-align: center;
        }

        .savingTable td{
            border: 1px solid black;
            padding: 5px;
            text-align: center;
        }
    </style>
    <body>
        <div class="document">
            <div class="topic">สมุดประจำตัวสมาชิก</div>
            <div style="display: flex;">ชื่อผู้ให้เงินสมทบ<div class="line" style="width: 30%;">{{user.firstName}} {{user.lastName}}</div></div>
            <div class="savingTable" style="margin-top: 20pt;">
                <table>
                    <thead>
                        <tr>
                            <th rowspan="2">ครั้งที่</th>
                            <th rowspan="2">วัน เดือน ปี</th>
                            <th colspan="2">เงินสมทบ <br>.........บาท</th>
                            <th rowspan="2">จำนวนเงิน</th>
                            <th rowspan="2">เหรัญญิก</th>
                            <th rowspan="2">หมายเหตุ</th>
                        </tr>
                        <tr>
                            <th style="width: 40pt;">ส่ง</th>
                            <th style="width: 40pt;">ขาด</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{#savingList}}
                        <tr>
                            <td></td>
                            <td>{{savingDate}}</td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>{{savingAmount}}</td>
                            <td></td>
                            <td></td>
                        </tr>
                        {{/savingList}}
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                       
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                                </svg>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </div>
    </body>
</html>