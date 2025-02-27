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
            .page-break {page-break-after: always;}
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
            background-color: lightgray;
        }
        .line{
            border-bottom: solid 0.5pt;
            text-align: center;
        }
        p {
            font-weight: 600;
        }
        .vaulnerableTable table, .executive table, .financeTable table{
            display: table;
            border-collapse: collapse;
            box-sizing: border-box;
            text-indent: initial;
            border-spacing: 2px;
            font-size: .9em;
            border: solid 1px;
            width: 100%;
        }
        .vaulnerableTable th, .executive th, .financeTable th{
            border: 1px solid black;
            padding: 5px;
            text-align: center;
        }
        .vaulnerableTable thead, .executive thead, .financeTable thead{
            display: table-header-group;
            vertical-align: middle;
            border-color: inherit;
            border: 1px solid;
        }
        .vaulnerableTable td, .executive td, .financeTable td{
            border: 1px solid black;
            padding: 5px;
            text-align: center;
        }
        .graduateTable tr{
            height: 40pt;
        }
        .executive tr{
            height: 20pt;
        }
        .signed{
            margin-left: 20%;
            text-align: center;
            margin-top: 20px;
            align-items: center;
            justify-content: center;
        }
    </style>
    <body>
        <div class="document">
            <div class="topic" style="margin-top: 20pt;">1. แบบเเสดงสถานะกองทุน</div>
            <div style="font-weight: 600; text-align: center; margin-top: 20pt;">
                <div>แบบเเสดงสถานะกองทุนสวัสดิการชุมชน</div>
                <div style="display: flex; justify-content: center;">ตำบล/เทศบาล<div class="line" style="width: 30%;">ทรัพย์อนันต์</div></div>
                <div style="display: flex; justify-content: center;">อำเภอ<div class="line" style="width: 10%;">ท่าเเซะ</div>จังหวัด<div class="line" style="width: 10%;">ชุมพร</div></div>
            </div>
            <div>
                <div style="font-weight: 600; display: flex;">1. ชื่อกลุ่ม/กองทุน<div class="line" style="width: 20%;">ตำบลทรัพย์อนันต์</div></div>
                <div style="display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        ที่ตั้งเลขที่<div class="line" style="width: 10%;">119</div>หมู่บ้าน<div class="line"style="width: 20%;" >เกาะอม</div>หมู่ที่<div class="line" style="width: 10%;">4</div>ตรอก/ซอย<div class="line"style="width: 10%;" >-</div>
                        ถนน<div class="line"style="width: 10%;" >-</div>
                    </div>
                    <div style="display: flex;">
                        ตำบล/เเขวง<div class="line" style="width: 15%;">ทรัพย์อนันต์</div>อำเภอ/เขต<div class="line" style="width: 15%;">ท่าเเซะ</div>
                        จังหวัด<div class="line" style="width: 15%;">ชุมพร</div>รหัสไปรษณีย์<div class="line" style="width: 10%;">86140</div>
                    </div>
                    <div style="display: flex;">
                        โทรศัพท์<div class="line" style="width: 15%;"></div>
                        โทรศัพท์มือถือ<div class="line" style="width: 15%;"></div>
                        โทรสาร<div class="line" style="width: 15%;"></div>
                        อีเมล/เว็บไซต์<div class="line" style="width: 15%;"></div>
                    </div>
                </div>
                <div>
                    <div style="font-weight: 600; display: flex;">ชื่อประธานกองทุน<div class="line" style="width: 60%;">{{userchairman.firstName}} {{userchairman.lastName}}</div></div>
                    <div style="display: flex;">
                        ที่ตั้งเลขที่<div class="line" style="width: 10%;">{{addresschairman.addressNumber}}</div>หมู่บ้าน<div class="line"style="width: 20%;" >{{addresschairman.community}}</div>หมู่ที่<div class="line" style="width: 10%;">{{addresschairman.moo}}</div>ตรอก/ซอย<div class="line"style="width: 10%;" >{{addresschairman.alley}}</div>
                        ถนน<div class="line"style="width: 10%;" >{{addresschairman.road}}</div>
                    </div>
                    <div style="display: flex;">
                        ตำบล/เเขวง<div class="line" style="width: 15%;">{{addresschairman.subDistrictID}}</div>อำเภอ/เขต<div class="line" style="width: 15%;">{{addresschairman.districtID}}</div>
                        จังหวัด<div class="line" style="width: 15%;">{{addresschairman.province}}</div>รหัสไปรษณีย์<div class="line" style="width: 10%;">{{addresschairman.postalCode}}</div>
                    </div>
                    <div style="display: flex;">
                        โทรศัพท์<div class="line" style="width: 15%;"></div>
                        โทรศัพท์มือถือ<div class="line" style="width: 15%;">{{addresschairman.telephoneNumber}}</div>
                        โทรสาร<div class="line" style="width: 15%;"></div>
                        อีเมล/เว็บไซต์<div class="line" style="width: 15%;">{{userchairman.email}}</div>
                    </div>
                </div>
                <div>
                    <div style="font-weight: 600; display: flex;">ชื่อผู้ประสานงาน<div class="line" style="width: 60%;">{{userCoordinator.firstName}}  {{userCoordinator.lastName}}</div></div>
                    <div style="display: flex;">
                        ที่ตั้งเลขที่<div class="line" style="width: 10%;">{{addressCoordinator.addressNumber}}</div>หมู่บ้าน<div class="line"style="width: 20%;" >{{addressCoordinator.community}}</div>หมู่ที่<div class="line" style="width: 10%;">{{addressCoordinator.moo}}</div>ตรอก/ซอย<div class="line"style="width: 10%;" >{{addressCoordinator.alley}}</div>
                        ถนน<div class="line"style="width: 10%;" >{{addressCoordinator.road}}</div>
                    </div>
                    <div style="display: flex;">
                        ตำบล/เเขวง<div class="line" style="width: 15%;">{{addressCoordinator.subDistrictID}}</div>อำเภอ/เขต<div class="line" style="width: 15%;">{{addressCoordinator.districtID}}</div>
                        จังหวัด<div class="line" style="width: 15%;">{{addressCoordinator.province}}</div>รหัสไปรษณีย์<div class="line" style="width: 10%;">{{addressCoordinator.postalCode}}</div>
                    </div>
                    <div style="display: flex;">
                        โทรศัพท์<div class="line" style="width: 15%;"></div>
                        โทรศัพท์มือถือ<div class="line" style="width: 15%;">{{addressCoordinator.telephoneNumber}}</div>
                        โทรสาร<div class="line" style="width: 15%;"></div>
                        อีเมล/เว็บไซต์<div class="line" style="width: 15%;">{{userCoordinator.email}}</div>
                    </div>
                </div>
            </div>
            <div style="margin-top: 20pt;">
                <div style="display: flex;"><p style="font-weight: 600; margin-right: 5pt;">2. ก่อตั้งเมื่อ</p>วันที่<div class="line" style="width: 10%;">1</div>เดือน<div class="line" style="width: 15%;">มกราคม</div>พ.ศ<div class="line" style="width: 10%;">2549</div></div>
                <div style="display: flex;"><p style="font-weight: 600;">ชื่อองค์กรที่สนับสนุนการจัดตั้ง</p><div class="line" style="width: 20%;"></div></div>
                <div><p style="font-weight: 600;">วัตถุประสงค์ของการจัดตั้งกลุ่ม/กองทุน</p></div>
                <div class="line" style="width: 80%; text-align: start;">1. ส่งเสริมให้สมาชิกรู้จักออมเงินเพื่อเบ่งปันช่วยเหลือซึ่งกันเเละกัน</div>
                <div class="line" style="width: 80%; text-align: start;">2. เพื่อจัดสวัสดิการเเก่สมาชิกตลอดชีวิตในเรื่องการเกิด การเเก่ การเจ็บ การตาย เเละอื่น ๆ</div>
                <div class="line" style="width: 80%; text-align: start;">3. เพื่อให้เกิดคุณธรรม ความสามัคคีมีน้ำใจ ร่วมกันเเก้ไขปัญหา สร้างสัมพันธภาพที่ดีเเก่สมาชิก</div>
                <div class="line" style="width: 80%; text-align: start;">4. เพื่อให้ชุมชนเข้มเเข็ง มีองค์กรคอยช่วยเหลือ</div>
            </div>
            <div style="margin-top: 20pt;">
                <div style="font-weight: 600; display: flex;">3. ข้อมูลสมาชิกกองทุน</div>
                <div style="margin-left: 10pt; margin-top: 10pt;">
                    <div style="display: flex;">3.1 จำนวนสมาชิกเเรกตั้ง<div class="line" style="width: 15%;">276</div>สมาชิกสะสมถึงปัจจุบัน<div class="line" style="width: 15%;">{{calculateAllTypeMember.รวมสะสม}}</div></div>
                    <div style="display: flex;">จำนวนสมาชิกคงเหลือ (หักตาย ลาออกเเละพ้นสภาพการเป็นสมาชิก) ปัจจุบัน<div class="line" style="width: 15%;">{{calculateTypeMember.รวม}}</div>คน</div>
                    <div style="display: flex;">
                        ณ วันที่<div class="line" style="width: 10%;">3</div>เดือน<div class="line" style="width: 15%;">สิงหาคม</div>พ.ศ<div class="line" style="width: 10%;">2566</div>
                        จากจำนวนประชากรในชุมชนทั้งหมด<div class="line" style="width: 15%;">3,950</div>คน
                    </div>
                    <div style="display: flex; flex-direction: column; margin-left: 20pt;">
                        <div>- สมาชิกสะสม หมายถึง สมาชิกสะสมนับตั้งเเต่วันก่อตั้งถึงปัจจุบัน</div>
                        <div>- สมาชิกปัจจุบัน หมายถึง สมาชิกที่หัก ตาย ลาออก ขาดคุณสมบัติการเป็นสมาชิก</div>
                        <div>- สมาชิกที่ขอรับการสมทบ หมายถึง สมาชิกครบปีเเละเป็นไปตามเกณฑ์เงื่อนไขการสมทบงบสวัสดิการ</div>
                    </div>
                </div>
                <div style="display: flex; margin-left:10pt; margin-top: 10pt;">3.2 จำนวนผู้ที่เป็นสมาชิก (เลือกเพียง 1 ข้อ)</div>
                <div style="display: flex; margin-left: 15pt;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <p>ไม่ขอรับการสมทบงบประมาณ</p>
                </div>
                <div style="display: flex; margin-left: 15pt;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div>
                        <div style="display: flex;">
                            <p style="width: 430pt;">กองทุนที่เสนอรับการสมทบครั้งเเรกครบรอบ 1 ปี ณ วันก่อตั้งกองทุน</p>
                            <div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ.<div class="line" style="width: 10%;"></div>
                        </div>
                        <div style="display: flex;">จำนวนสมาชิก<div class="line" style="width: 15%;"></div></div>
                    </div>
                </div>
               
            </div>
        </div>  
        <div class="document">
            <div style="display: flex; width: 100%; margin-left: 15pt; margin-top: 20pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex;">
                    <p style="width: 270pt;">กองทุนเสนอเดิมรับการสมทบรอบที่สอง</p>
                    <div style="width: 490pt; text-align: start;">จากการได้รับอนุมัติงบประมาณสมทบของคณะอนุกรรมการประสานขบวน</div>
                </div>
            </div>
            <div style="display: flex;">องค์กรชุมชน/คณะทำงานพิจารณาโครงการของภาคฯ รอบเเรกเมื่อวันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ<div class="line" style="width: 10%;"></div></div>
            <div style="display: flex;">จำนวนสมาชิกทั้งหมดเดิม<div class="line" style="width: 15%;"></div>คน จำนวนสมาชิกครบปีเดิม<div class="line" style="width: 15%;"></div>คน</div>
            <div style="display: flex;">จำนวนสมาชิกที่เสนอรับการสมทบรอบนี้<div class="line" style="width: 15%;"></div>คน</div>
            <div style="display: flex;">(สมาชิกครบ 1 ปี ณ วันที่<div class="line" style="width: 10%;">30</div>เดือน<div class="line" style="width: 15%;">กันยายน</div>พ.ศ.<div class="line" style="width: 10%;">{{year}}</div>)</div>
            <div style="display: flex; width: 100%; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex;">
                    <p style="width: 270pt;">กองทุนเสนอเดิมรับการสมทบรอบที่สาม</p>
                    <div style="width: 490pt; text-align: start;">จากการได้รับอนุมัติงบประมาณสมทบของคณะอนุกรรมการประสานขบวน</div>
                </div>
            </div>
            <div style="display: flex;">องค์กรชุมชน/คณะทำงานพิจารณาโครงการของภาคฯ รอบเเรกเมื่อวันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ<div class="line" style="width: 10%;"></div></div>
            <div style="display: flex;">จำนวนสมาชิกทั้งหมดเดิม<div class="line" style="width: 15%;"></div>คน จำนวนสมาชิกครบปีเดิม<div class="line" style="width: 15%;"></div>คน</div>
            <div style="display: flex;">จำนวนสมาชิกที่เสนอรับการสมทบรอบนี้<div class="line" style="width: 15%;"></div>คน</div>
            <div style="display: flex;">(สมาชิกครบ 1 ปี ณ วันที่<div class="line" style="width: 10%;">30</div>เดือน<div class="line" style="width: 15%;">กันยายน</div>พ.ศ.<div class="line" style="width: 10%;">{{year}}</div>)</div>
            <div style="display: flex; width: 100%; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex;">
                    <p style="width: 270pt;">กองทุนเสนอเดิมรับการสมทบรอบที่</p>
                    <div class="line" style="width: 10%;"></div>
                    <div style="width: 420pt;">&nbsp;(สมาชิกกองทุนที่ยังไม่ได้รับการสมทบครบ 3 ครั้ง)</div>
                    <!-- <div style="width: 490pt; text-align: start;">จากการได้รับอนุมัติงบประมาณของคณะอนุกรรมการประสานขบวนองค์กร</div> -->
                </div>
            </div>
            <div style="display: flex;">จากการได้รับอนุมัติงบประมาณสมทบของคณะอนุกรรมการประสานขบวนองค์กรชุมชน/คณะทำงาน</div>
            <div style="display: flex;">พิจารณาโครงการของภาคฯ รอบ<div class="line" style="width: 10%;"></div>ณ วันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ.<div class="line" style="width: 10%;"></div></div>
            <div style="display: flex;">จำนวนสมาชิกทั้งหมดเดิม<div class="line" style="width: 15%;"></div>คน จำนวนสมาชิกครบปีเดิม<div class="line" style="width: 15%;"></div>คน</div>
            <div style="display: flex;">จำนวนสมาชิกที่เสนอรับการสมทบรอบนี้<div class="line" style="width: 15%;"></div>คน</div>
            <div style="display: flex;">(สมาชิกครบ 1 ปี ณ วันที่<div class="line" style="width: 10%;">30</div>เดือน<div class="line" style="width: 15%;">กันยายน</div>พ.ศ.<div class="line" style="width: 10%;">{{year}}</div>)</div>
            <div style="margin-left: 10pt; margin-top: 10pt;">3.3 ลักษณะของสมาชิก</div>
            <div class="vaulnerableTable" style="width: 80%;  margin-left: auto; margin-right: auto; margin-top: 10pt;">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 20%;">ประเภทสมาชิก</th>
                            <th>จำนวนสมาชิกสะสม (คน)</th>
                            <th>จำนวนสมาชิกปัจจุบัน (คน)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>บุคคลทั่วไป</td>
                            <td>{{calculateAllTypeMember.ทั่วไป}}</td>
                            <td>{{calculateTypeMember.ทั่วไป}}</td>
                        </tr>
                        <tr>
                            <td>เด็ก/เยาวชน</td>
                            <td>{{calculateAllTypeMember.เด็ก}}</td>
                            <td>{{calculateTypeMember.เด็ก}}</td>
                        </tr>
                        <tr>
                            <td>ผู้สูงอายุ</td>
                            <td>{{calculateAllTypeMember.ผู้สูงอายุ}}</td>
                            <td>{{calculateTypeMember.ผู้สูงอายุ}}</td>
                        </tr>
                        <tr>
                            <td>ผู้ด้อยโอกาส</td>
                            <td>{{calculateAllTypeMember.ด้อยโอกาส}}</td>
                            <td>{{calculateTypeMember.ด้อยโอกาส}}</td>
                        </tr>
                        <tr>
                            <td>ผู้พิการ</td>
                            <td>{{calculateAllTypeMember.พิการ}}</td>
                            <td>{{calculateTypeMember.พิการ}}</td>
                        </tr>
                        <tr>
                            <td>กำพร้า</td>
                            <td>{{calculateAllTypeMember.กำพร้า}}</td>
                            <td>{{calculateTypeMember.กำพร้า}}</td>
                        </tr>
                        <tr>
                            <td>รวม</td>
                            <td>{{calculateAllTypeMember.รวมสะสม}}</td>
                            <td>{{calculateTypeMember.รวม}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">3.4 การกระจายตัวของสมาชิก</div>
            <div style="display:flex; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 100%;">
                    <div style="display: flex; width: 100%;">สมาชิกมาจากจำนวน<div class="line" style="width: 10%;">7</div>หมู่บ้าน/ชุมชน</div>
                    <div style="display: flex;">จากจำนวนหมู่บ้าน/ชุมชนทั้งหมดในตำบล/เทศบาล/เขต ทั้งหมดจำนวน<div class="line" style="width: 10%;">7</div>หมู่บ้าน/ชุมชน</div>
                </div>
            </div>
            <div style="margin-top: 20pt; font-weight: 600;">4. ข้อมูลกองทุนสวัสดิการชุมชน</div>
            <div style="margin-left: 10pt; margin-top: 10pt; display: flex;">4.1 จำนวนเงินกองทุนสวัสดิการ ณ วันเริ่มวันเเรก<div class="line" style="width: 10%;">30,660</div></div>
            <div style="display: flex;">จำนวนเงินกองทุนสวัสดิการสะสมถึงปัจจุบัน รวม<div class="line" style="width: 15%;">{{calculateIncome.รวมรายรับ}}</div>บาท</div>
            <div style="display: flex;">จำนวนเงินกองทุนสวัสดิการคงเหลือ<div class="line" style="width: 15%;"></div>บาท ณ วันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ<div class="line" style="width: 10%;"></div></div>
        </div>
        <div class="document">
            <div style="margin-left: 10pt; margin-top: 20pt;">4.2 จำนวนเงินสมทบกองทุนสวัสดิการชุมชนของสมาชิก</div>
            <div style="display: flex; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <p>ไม่ขอรับการสมทบงบประมาณ</p>
            </div>
            <div style="display: flex; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <p>กองทุนที่ขอสมทบครั้งเเรก ครบรอบ 1 ปี</p>
            </div>
            <div style="display: flex;">
                ณ วันก่อตั้งกองทุน<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ.<div class="line" style="width: 10%;"></div>
                จำนวน<div class="line" style="width: 15%;"></div>บาท
            </div>
            <div style="display: flex; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <p>กองทุนเดิมเสนอรับการสมทบรอบที่สอง</p>
                <div style="margin-left: 5pt;">จากการได้รับอนุมัติงบประมาณสมทบของคณะอนุกรรมการประสานงาน</div>
            </div>
            <div>ขบวนองค์กรชุมชน/คณะทำงานพิจารณาโครงการของภาคฯ รอบแรก</div>
            <div style="display: flex;">
                เมื่อวันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ<div class="line" style="width: 10%;"></div>
                &nbsp;&nbsp;&nbsp;จำนวนเงินเดิม<div class="line" style="width: 15%;"></div>บาท
            </div>
            <div style="display: flex;">
                จำนวนเงินที่เสนอรับการสมทบรอบนี้<div class="line" style="width: 15%;"></div>บาท
            </div>
            <div style="display: flex; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <p>กองทุนเดิมเสนอรับการสมทบรอบที่สาม</p>
                <div style="margin-left: 5pt;">จากการได้รับอนุมัติงบประมาณสมทบของคณะอนุกรรมการประสานงาน</div>
            </div>
            <div>ขบวนองค์กรชุมชน/คณะทำงานพิจารณาโครงการของภาคฯ รอบสอง</div>
            <div style="display: flex;">
                เมื่อวันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ<div class="line" style="width: 10%;"></div>
                &nbsp;&nbsp;&nbsp;จำนวนเงินเดิม<div class="line" style="width: 15%;"></div>บาท
            </div>
            <div style="display: flex;">
                จำนวนเงินที่เสนอรับการสมทบรอบนี้<div class="line" style="width: 15%;"></div>บาท
            </div>
            <div style="display: flex; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <p style="display: flex;">กองทุนเดิมเสนอรับการสมทบในปีที่<div class="line" style="width: 5%;"></div></p>
                <div style="margin-left: 5pt;">จากการได้รับอนุมัติงบประมาณสมทบของคณะอนุกรรมการประสานงาน</div>
            </div>
            <div style="display: flex;">ขบวนองค์กรชุมชน/คณะทำงานพิจารณาโครงการของภาคฯ รอบ<div class="line" style="width: 5%;"></div></div>
            <div style="display: flex;">
                เมื่อวันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ<div class="line" style="width: 10%;"></div>
                &nbsp;&nbsp;&nbsp;จำนวนเงินเดิม<div class="line" style="width: 15%;"></div>บาท
            </div>
            <div style="display: flex;">
                จำนวนเงินที่เสนอรับการสมทบรอบนี้<div class="line" style="width: 15%;"></div>บาท
            </div>
            <div style="display: flex; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">จำนวนเงินที่ได้รับการอนุมัติจริง ปี<div class="line" style="width: 10%;"></div>จำนวน<div class="line" style="width: 15%;"></div>บาท</div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">4.3 ที่มาของเงินกองทุนสวัสดิการมาจาก (นับตั้งเเต่วันเริ่มก่อตั้งกองทุน)</div>
            <div style="display: flex; margin-left: 15pt; width: 80%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 80%;">เงินสมทบสวัสดิการจากสมาชิก</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 80%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 80%;">สมทบจากผลกำไรกลุ่มองค์กรในชุมชน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 80%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 80%;">องค์การบริหารส่วนท้องถิ่น (อบต./เทศบาล/อบจ.)</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 80%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 80%;">สถาบันพัฒนาองค์กรชุมชน (พอช.) <br>(55,000/ 100,000 บาท)</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 80%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 80%;">สถาบันพัฒนาองค์กรชุมชน (พอช.) <br>(งบสมทบจากรัฐบาลผ่าน พอช.)</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                </div>
            </div>
            <div style="margin-left: 30pt;">
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบเเรก</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบสอง</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบสาม</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบสี่</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบห้า</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบหก</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบเจ็ด</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบแปด</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบเก้า</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบสิบ</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 20%;">รอบสิบเอ็ด</div>
                        <div style="width: 80%; display: flex;"><div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="document">
            <div style="margin-top: 20pt;">
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 80%;">หน่วยงานภาครัฐอื่นๆ <br>(ที่นอกเหนือจากการสมทบที่ผ่าน พอช.)</div>
                        <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 80%;">ดอกเบี้ยธนาคาร</div>
                        <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 80%;">ค่าธรรมเนียมเเรกเข้า</div>
                        <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 80%;">เงินบริจาค</div>
                        <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 80%;">อื่นๆ</div>
                        <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="display: flex; width: 100%;">
                        <div style="width: 80%;">อื่นๆ</div>
                        <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 70%;"></div>บาท</div>
                    </div>
                </div>
            </div>
            <div style="display: flex; margin-left: 50%;">
                รวมจำนวนเงิน<div class="line" style="width: 30%;"></div>บาท
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">4.4 ลักษณะการสมทบเพื่อสวัสดิการ</div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="margin-top: 2pt;">
                    <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                        <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                    </svg>
                                                         
                </div>
                <div style="width: 50%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">รายวัน<div class="line" style="width: 50%;"></div>บาท</div>
                <div style="margin-top: 2pt;">
                    <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                        <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                    </svg>
                                                           
                </div>
                <div style="width: 50%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">รายเดือน<div class="line" style="width: 50%;"></div>บาท</div>
            </div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="margin-top: 2pt;">
                    <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                        <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                    </svg>
                                                           
                </div>
                <div style="width: 50%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">รายปี<div class="line" style="width: 50%;"></div>บาท</div>
                <div style="margin-top: 2pt;">
                    <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                        <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                    </svg>
                                                           
                </div>
                <div style="width: 50%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div>บาท</div>
            </div>
            <div style="margin-top: 20pt; font-weight: 600; display: flex;">5. สวัสดิการที่จัดให้กับสมาชิกมี<div class="line" style="width: 10%;">{{calculateAllWelfareAppliance.จำนวนสวัสดิการสะสม}}</div>ประเภท อะไรบ้าง (ยอดสะสม)</div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเกี่ยวกับเด็กแรกเกิด/คลอดบุตร</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ1}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.1}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเกี่ยวกับการเจ็บป่วย/รักษาพยาบาล</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ2}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.2}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเกี่ยวกับผู้สูงอายุ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ3}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.3}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการกรณีเสียชีวิต</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ4}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.4}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการค่าใช้จ่ายเกี่ยวกับงานศพ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ5}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.5}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการคนด้อยโอกาส/พิการ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ6}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.6}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเพื่อพัฒนาอาชีพ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ7}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.7}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเพื่อการศึกษา</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ8}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.8}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการประเพณีวัฒนธรรม</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ9}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.9}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเพื่อที่อยู่อาศัย (ช่อม/สร้าง)</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ10}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.10}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการช่วยเหลือผู้ประสบภัยพิบัติ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ11}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.11}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการสนับสนุนกิจกรรมสาธารณะประโยชน์</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ12}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.12}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการสนับสนุนด้านทรัพยากรธรรมชาติเเละสิ่งเเวดล้อม</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ13}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.13}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;">ประชาสัมพันธ์</div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ14}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.14}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;">ตอบแทนองค์กร</div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ15}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.15}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;">Covid-19</div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนของ16}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.16}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <div style="width: 15pt;"></div>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex; font-weight: 600;">รวม</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนคนรวมสะสม}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateAllWelfareAppliance.จำนวนเงินรวมสะสม}}</div>บาท</div>
                </div>
            </div>
            <!-- <div style="margin-top: 20pt; font-weight: 600; display: flex;">6. สวัสดิการที่จัดให้กับสมาชิกมี<div class="line" style="width: 10%;">{{calculateWelfareAppliance.จำนวนสวัสดิการ}}</div>ประเภท อะไรบ้าง</div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเกี่ยวกับเด็กแรกเกิด/คลอดบุตร</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ1}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.1}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเกี่ยวกับการเจ็บป่วย/รักษาพยาบาล</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ2}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.2}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเกี่ยวกับผู้สูงอายุ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ3}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.3}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการกรณีเสียชีวิต</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ4}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.4}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการค่าใช้จ่ายเกี่ยวกับงานศพ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ5}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.5}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการคนด้อยโอกาส/พิการ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ6}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.6}}</div>บาท</div>
                </div>
            </div> -->
        </div>
        <div class="document">
            <div style="margin-top: 20pt; font-weight: 600; display: flex;">6. สวัสดิการที่จัดให้กับสมาชิกมี<div class="line" style="width: 10%;">{{calculateWelfareAppliance.จำนวนสวัสดิการ}}</div>ประเภท อะไรบ้าง</div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเกี่ยวกับเด็กแรกเกิด/คลอดบุตร</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ1}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.1}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเกี่ยวกับการเจ็บป่วย/รักษาพยาบาล</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ2}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.2}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเกี่ยวกับผู้สูงอายุ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ3}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.3}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการกรณีเสียชีวิต</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ4}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.4}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการค่าใช้จ่ายเกี่ยวกับงานศพ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ5}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.5}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการคนด้อยโอกาส/พิการ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ6}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.6}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเพื่อพัฒนาอาชีพ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ7}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.7}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเพื่อการศึกษา</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ8}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.8}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการประเพณีวัฒนธรรม</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ9}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.9}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการเพื่อที่อยู่อาศัย (ช่อม/สร้าง)</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ10}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.10}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการช่วยเหลือผู้ประสบภัยพิบัติ</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ11}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.11}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการสนับสนุนกิจกรรมสาธารณะประโยชน์</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ12}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.12}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%;">สวัสดิการสนับสนุนด้านทรัพยากรธรรมชาติเเละสิ่งเเวดล้อม</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ13}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.13}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;">ประชาสัมพันธ์</div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ14}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.14}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;">ตอบแทนองค์กร</div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ15}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.15}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;">Covid-19</div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนของ16}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.16}}</div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex;">สวัสดิการอื่นๆ<div class="line" style="width: 50%;"></div></div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <div style="width: 15pt;"></div>
                <div style="display: flex; width: 100%;">
                    <div style="width: 100%; display: flex; font-weight: 600;">รวม</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนคนรวม}}</div>คน</div>
                    <div style="width: 60%; display: flex;">จำนวน<div class="line" style="width: 50%;">{{calculateWelfareAppliance.จำนวนเงินรวม}}</div>บาท</div>
                </div>
            </div>
            <div style="margin-top: 20pt; display: flex;"><div style="font-weight: 600;">7. กองทุนสวัสดิการได้สนับสนุนกิจกรรมต่างๆ ของชุมชน</div><div>(ตอบได้มากกว่า 1 ข้อ/ในรอบปีที่ผ่านมามีการจ่ายสวัสดิการ</div></div>
            <div>ผลการดำเนินงาน)</div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 100%;">
                    <div style="width: 70%; display: flex;">ช่วยเหลือผู้ด้อยโอกาสในชุมชน (ที่ไม่ใช่สมาชิก)</div>
                    <div style="width: 40%; display: flex;">จำนวน<div class="line" style="width: 50%;"></div>คน</div>
                    <div style="width: 60%; display: flex;">งบประมาณ<div class="line" style="width: 50%;"></div>บาท</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 100%; display: flex;">กิจกรรมด้านประเพณีวัฒนธรรม/ศาสนา ในเรื่อง<div class="line" style="width: 50%;"></div></div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 100%; display: flex;">กิจกรรมด้านกีฬาเเละนันทนาการ ในเรื่อง<div class="line" style="width: 50%;"></div></div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 100%; display: flex;">กิจกรรมด้านสิ่งเเวดล้อมทรัพยากรธรรมชาติ ในเรื่อง<div class="line" style="width: 50%;"></div></div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">กิจกรรมสาธารณะประโยชน์อื่นๆ</div>
                    <div style="display: flex;">1. <div class="line" style="width: 100%;"></div></div>
                    <div style="display: flex;">2. <div class="line" style="width: 100%;"></div></div>
                </div>
                <!-- <div style="display: flex; width: 100%; flex-direction: column">
                    <div style="width: 100%;">กิจกรรมสาธารณะประโยชน์อื่นๆ</div>
                    <div style="display: flex; width: 90%;">
                        <div style="display: flex;">1. <div class="line" style="width: 50%;"></div></div>
                        <div style="display: flex;">2. <div class="line" style="width: 50%;"></div></div>
                    </div>
                </div> -->
            </div>
            <!-- <div style="margin-top: 20pt; display: flex;"><div style="font-weight: 600; display: flex; width: 100%;">8. คณะกรรมการกองทุน มีจำนวน<div class="line" style="width: 10%;"></div>คน</div></div>
            <div style="margin-left: 10pt; margin-top: 10pt;">8.1 องค์ประกอบด้วยคณะกรรมการ (ตอบได้มากกว่า 1 ข้อ)</div>
            <div style="display: flex;">
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">ผู้เเทนสมาชิก</div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 100%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">ผู้เเทนองค์กรปกครองส่วนท้องถิ่น</div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 100%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">กำนัน/ผู้ใหญ่บ้าน</div>
                </div>
            </div>
            <div style="display: flex;">
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">พระ</div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 100%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">ผู้ทรงคุณวุฒิในชุมชน</div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 100%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">อื่นๆ<div class="line" style="width: 70%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">8.2 รายชื่อคณะกรรมการกองทุน</div>
            <div class="executive">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 10%;">ลำดับที่</th>
                            <th style="width: 30%;">ชื่อ-นามสกุล</th>
                            <th style="width: 20%;">ตำเเหน่งใน<br>กองทุน</th>
                            <th style="width: 20%;">ตำเเหน่งในชุมชน</th>
                            <th style="width: 18%;">หมายเลขโทรศัพท์</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>สมพิศ  หนูขวัญ</td>
                            <td>ประธานฯ</td>
                            <td>ตัวแทนสมาชิก ม.4</td>
                            <td>0892319075</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>จงใจ  จอดประสงค์</td>
                            <td>รองประธานฯ</td>
                            <td>ตัวแทนสมาชิก ม.7</td>
                            <td>0872835976</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>สุภาวดี  ชุมพูนุช</td>
                            <td>เหรัญญิกฯ</td>
                            <td>ตัวแทนสมาชิก ม.4</td>
                            <td>0937459339</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>ธวัชชัย  เมฆหมอก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.1</td>
                            <td>0828188969</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>ดารุณี  เมฆหมอก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.1</td>
                            <td>0937587484</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>ขนิษฐา  อารีราษฎ์</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.1</td>
                            <td>0625412811</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>จำรัส  นุ้ยมาก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.2</td>
                            <td>0986704725</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>สุนิพร  อินทวาด</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.2</td>
                            <td>0817924050</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>พัชรียา  ดำภูผา</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.2</td>
                            <td>0884438358</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>โสภา  วรรณเผือก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.3</td>
                            <td>0822803019</td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>อัจฉราพร  ด้วงเผือก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.3</td>
                            <td>0613029686</td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td>ประเสริฐ  จินดามณี</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.4</td>
                            <td>0878886272</td>
                        </tr>
                        <tr>
                            <td>13</td>
                            <td>บัญหาร  กิ้มเซียะ</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.5</td>
                            <td>0987102935</td>
                        </tr>
                        <tr>
                            <td>14</td>
                            <td>มนฑา  นุชพรหม</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.5</td>
                            <td>0828134789</td>
                        </tr>
                        <tr>
                            <td>15</td>
                            <td>นันทิกานต์  เมฆหมอก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.6</td>
                            <td>0622434997</td>
                        </tr>
                        <tr>
                            <td>16</td>
                            <td>มนเฑียร  จันทดี</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.6</td>
                            <td>0817883096</td>
                        </tr>
                        <tr>
                            <td>17</td>
                            <td>สมศรี  ดำภูผา</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.7</td>
                            <td>0623151035</td>
                        </tr>
                        <tr>
                            <td>18</td>
                            <td>อังขณา  บัวสารบรรณ์</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.7</td>
                            <td>0872722849</td>
                        </tr>
                        <tr>
                            <td>19</td>
                            <td>เตือนใจ  พุ่มสร้าง</td>
                            <td>เลขานุการฯ</td>
                            <td>ตัวแทนสมาชิก ม.3</td>
                            <td>0638684613</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div> -->
        </div>
        <div class="document">
            <div style="margin-top: 20pt; display: flex;"><div style="font-weight: 600; display: flex; width: 100%;">8. คณะกรรมการกองทุน มีจำนวน<div class="line" style="width: 10%;">19</div>คน</div></div>
            <div style="margin-left: 10pt; margin-top: 10pt;">8.1 องค์ประกอบด้วยคณะกรรมการ (ตอบได้มากกว่า 1 ข้อ)</div>
            <div style="display: flex;">
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">ผู้เเทนสมาชิก</div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 100%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">ผู้เเทนองค์กรปกครองส่วนท้องถิ่น</div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 100%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">กำนัน/ผู้ใหญ่บ้าน</div>
                </div>
            </div>
            <div style="display: flex;">
                <div style="display: flex; margin-left: 15pt; width: 80%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">พระ</div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 100%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">ผู้ทรงคุณวุฒิในชุมชน</div>
                </div>
                <div style="display: flex; margin-left: 15pt; width: 100%;">
                    <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                        <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                    </svg>
                    <div style="width: 100%; display: flex; margin-left: 5pt;">อื่นๆ<div class="line" style="width: 70%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">8.2 รายชื่อคณะกรรมการกองทุน</div>
            <div class="executive">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 10%;">ลำดับที่</th>
                            <th style="width: 30%;">ชื่อ-นามสกุล</th>
                            <th style="width: 20%;">ตำเเหน่งใน<br>กองทุน</th>
                            <th style="width: 20%;">ตำเเหน่งในชุมชน</th>
                            <th style="width: 18%;">หมายเลขโทรศัพท์</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>สมพิศ  หนูขวัญ</td>
                            <td>ประธานฯ</td>
                            <td>ตัวแทนสมาชิก ม.4</td>
                            <td>0892319075</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>จงใจ  จอดประสงค์</td>
                            <td>รองประธานฯ</td>
                            <td>ตัวแทนสมาชิก ม.7</td>
                            <td>0872835976</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>สุภาวดี  ชุมพูนุช</td>
                            <td>เหรัญญิกฯ</td>
                            <td>ตัวแทนสมาชิก ม.4</td>
                            <td>0937459339</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>ธวัชชัย  เมฆหมอก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.1</td>
                            <td>0828188969</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>ดารุณี  เมฆหมอก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.1</td>
                            <td>0937587484</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>ขนิษฐา  อารีราษฎ์</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.1</td>
                            <td>0625412811</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>จำรัส  นุ้ยมาก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.2</td>
                            <td>0986704725</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>สุนิพร  อินทวาด</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.2</td>
                            <td>0817924050</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>พัชรียา  ดำภูผา</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.2</td>
                            <td>0884438358</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>โสภา  วรรณเผือก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.3</td>
                            <td>0822803019</td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>อัจฉราพร  ด้วงเผือก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.3</td>
                            <td>0613029686</td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td>ประเสริฐ  จินดามณี</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.4</td>
                            <td>0878886272</td>
                        </tr>
                        <tr>
                            <td>13</td>
                            <td>บัญหาร  กิ้มเซียะ</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.5</td>
                            <td>0987102935</td>
                        </tr>
                        <tr>
                            <td>14</td>
                            <td>มนฑา  นุชพรหม</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.5</td>
                            <td>0828134789</td>
                        </tr>
                        <tr>
                            <td>15</td>
                            <td>นันทิกานต์  เมฆหมอก</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.6</td>
                            <td>0622434997</td>
                        </tr>
                        <tr>
                            <td>16</td>
                            <td>มนเฑียร  จันทดี</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.6</td>
                            <td>0817883096</td>
                        </tr>
                        <tr>
                            <td>17</td>
                            <td>สมศรี  ดำภูผา</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.7</td>
                            <td>0623151035</td>
                        </tr>
                        <tr>
                            <td>18</td>
                            <td>อังขณา  บัวสารบรรณ์</td>
                            <td>กรรมการ</td>
                            <td>ตัวแทนสมาชิก ม.7</td>
                            <td>0872722849</td>
                        </tr>
                        <tr>
                            <td>19</td>
                            <td>เตือนใจ  พุ่มสร้าง</td>
                            <td>เลขานุการฯ</td>
                            <td>ตัวแทนสมาชิก ม.3</td>
                            <td>0638684613</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="document">
            <div style="margin-top: 20pt; font-weight: 600;">9. ระบบบริหารกองทุน</div>
            <div style="margin-left: 10pt; margin-top: 10pt;">9.1 มีระเบียบหลักเกณฑ์ของกองทุน</div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 50%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">หลักเกณฑ์เกี่ยวกับสมาชิก</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">หลักเกณฑ์เกี่ยวกับคณะกรรมการกองทุน</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">หลักเกณฑ์เกี่ยวกับการจัดสวัสดิการ</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">9.2 มีระบบการจัดเก็บข้อมูลสมาชิก</div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 50%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">จัดเก็บในสมุดบันทึก</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">จัดเก็บเป็นไฟล์ในคอมพิวเตอร์ (ไม่ใช่ฐานข้อมูล)</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">จัดเก็บในฐานข้อมูลกองทุนสวัสดิการ</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 50%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">9.3 มีระบบการประชุมคณะกรรมการเเละสมาชิกกองทุน</div>
            <div style="margin-left: 20pt;"><li>คณะกรรมการกองทุน</li></div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 18%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">1 เดือน/ครั้ง</div>
                </div>
                <div style="display: flex; width: 25%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">มากกว่า 1 เดือน/ครั้ง</div>
                </div>
                <div style="display: flex; width: 25%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">น้อยกว่า 1 เดือน/ครั้ง</div>
                </div>
                <div style="display: flex; width: 25%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 90%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 20pt;"><li>สมาชิกกองทุน</li></div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 18%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">3 เดือน/ครั้ง</div>
                </div>
                <div style="display: flex; width: 18%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">6 เดือน/ครั้ง</div>
                </div>
                <div style="display: flex; width: 18%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">1 ปี/ครั้ง</div>
                </div>
                <div style="display: flex; width: 25%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 90%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 20pt;"><li>การทำรายงานการประชุม</li></div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 30%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">จัดทำรายงานทุกครั้ง</div>
                </div>
                <div style="display: flex; width: 30%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">จัดทำรายงานบางครั้ง</div>
                </div>
            </div>
            <div style="margin-left: 20pt;"><li>การบันทึกรายงานการะประชุม</li></div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 30%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">บันทึกในสมุดบันทึก</div>
                </div>
                <div style="display: flex; width: 30%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">บันทึกในคอมพิวเตอร์</div>
                </div>
                <div style="display: flex; width: 25%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 90%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">9.4 มีระบบการบันทึกบัญชีการเงิน</div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 80%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">สามารถออกจากรายงานการเงินที่เป็นปัจจุบัน</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">บัญชีการเงินไม่เป็นปัจจุบัน</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 80%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">สรุปยอดบัญชีการเงินเป็นรายปี</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">สรุปยอดนักบัญชีการเงินเป็นรายเดือน</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 80%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">9.5 มีระบบการติดตามประเมินผลโดยคณะกรรมการกองทุน</div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 80%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">มีแผนการติดตามประเมินทุก 3 เดือน</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">มีแผนการติดตามประเมินทุก 6 เดือน</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 80%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">มีแผนการติดตามประเมินทุก 1 ปี</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 80%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">9.6 มีระบบการติดตามประเมินผลโดยหน่วยงานภายนอก</div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 80%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">มีแผนการติดตามประเมินทุก 3 เดือน</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">มีแผนการติดตามประเมินทุก 6 เดือน</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 80%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">มีแผนการติดตามประเมินทุก 1 ปี</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 80%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">9.7 มีการรายงานผลการดำเนินงานต่อสมาชิกเเละผู้ที่เกี่ยวข้อง</div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 90%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">มีการรายงานผลต่อสมาชิก/คณะกรรมการกองทุน</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">รายงานผลต่อองค์กรปกครองส่วนท้องถิ่น</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 80%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">รายงานผลต่อหน่วยงานที่เกี่ยวข้อง</div>
                </div>
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 100%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">มีการติดประกาศรายงานผลการดำเนินงาน</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 20pt;">
                <div style="display: flex; width: 100%;">
                    <div style="margin-top: 2pt;">
                        <svg height="15" width="15" xmlns="http://www.w3.org/2000/svg">
                            <circle r="6" cx="7.5" cy="7.5" fill="white" stroke="black"/>
                        </svg>                                    
                    </div>
                    <div style="width: 80%; margin-bottom: 5pt; margin-left: 10pt; display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div></div>
                </div>
            </div>
        </div>
        <div class="document">
            <div style="margin-top: 20pt; font-weight: 600;">10. รายงานฐานะการเงินกองทุนสวัสดิการชุมชน</div>
            <div style="display: flex; margin-left: 10pt;">ยอดเงินคงเหลือ ณ วันที่<div class="line" style="width: 10%;">{{date}}</div>เดือน<div class="line" style="width: 15%;">{{month}}</div>พ.ศ<div class="line" style="width: 10%;">{{year}}</div></div>
            <div class="financeTable" style="margin-top: 20pt;">
                <table style="width: 100%;">
                    <thead>
                        <tr>
                            <th rowspan="2" style="width: 20%;">รายการรับ</th>
                            <th colspan="2">จำนวนเงิน</th>
                            <th rowspan="2" style="width: 20%;">รายการจ่าย</th>
                            <th colspan="2">จำนวนเงิน</th>
                        </tr>
                        <tr>
                            <th style="width: 10%">บาท</th>
                            <th style="width: 10%">สต.</th>
                            <th style="width: 10%">บาท</th>
                            <th style="width: 10%">สต.</th>
                        </tr>
                        <!-- <tr>
                            <th style="width: 40pt;">บาท</th>
                            <th style="width: 40pt;">สต.</th>
                        </tr> -->
                    </thead>
                    <tbody>
                        <tr>
                            <td style="font-weight: 600;">1. รายรับ</td>
                            <td></td>
                            <td></td>
                            <td style="font-weight: 600;">1. สินทรัพย์/เงินคงเหลือ</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>เงินสมทบจากมาชิก</td>
                            <td>{{calculateIncome.เงินสมทบจากสมาชิก}}</td>
                            <td></td>
                            <td>เงินฝากธนาคาร</td>
                            <td>{{calculateExpense.เงินฝากธนาคาร}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>สถาบันพัฒนาองค์กรชุมชน (พอช.) (55,000/100,000)</td>
                            <td>{{calculateIncome.100}}</td>
                            <td></td>
                            <td>เงินสดในมือ</td>
                            <td>{{calculateExpense.เงินสดในมือ}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>สถาบันพัฒนาองค์กรชุมชน (พอช.) (งบสมทบจากรัฐบาลผ่าน พอช.)</td>
                            <td>{{calculateIncome.200}}</td>
                            <td></td>
                            <td>จ่ายสวัสดิการให้กับสมาชิก</td>
                            <td>{{calculateExpense.จ่ายสวัสดิการให้สมาชิก}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>องค์กรปกครองส่วนท้องถิ่น (อบต./เทศบาล/อบจ.)</td>
                            <td>{{calculateIncome.300}}</td>
                            <td></td>
                            <td><div style="display: flex;">เงินลงทุนอื่นๆ<div class="line" style="width: 50%;">ธนาคารหมู่บ้าน</div></div></td>
                            <td>{{calculateIncome.1}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>หน่วยงานภาครัฐอื่นๆ (ที่นอกเหนือจากการสมทบที่ผ่าน พอช.)</td>
                            <td>{{calculateIncome.400}}</td>
                            <td></td>
                            <td><div style="display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div></div></td>
                            <td>{{calculateIncome.2}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><div style="display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div></div></td>
                            <td></td>
                            <td></td>
                            <td><div style="display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div></div></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="font-weight: 600; text-align: center;">1. รวมรายรับ</td>
                            <td>{{calculateIncome.รายรับ}}</td>
                            <td></td>
                            <td style="font-weight: 600; text-align: center;">1. สินทรัพย์/เงินคงเหลือ</td>
                            <td>{{calculateExpense.รายจ่าย}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="font-weight: 600;">2. รายได้</td>
                            <td></td>
                            <td></td>
                            <td style="font-weight: 600;">2. ค่าใช้จ่าย</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>ค่าธรรมเนียมเเรกเข้า/ค่าสมัคร</td>
                            <td>{{calculateIncome.1}}</td>
                            <td></td>
                            <td>ค่าตอบเเทนคนงาน</td>
                            <td>{{calculateIncome.3}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>เงินบริจาค</td>
                            <td>{{calculateIncome.2}}</td>
                            <td></td>
                            <td>ค่าพาหนะ</td>
                            <td>{{calculateIncome.4}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>ดอกเบี้ยเงินฝากธนาคาร</td>
                            <td>{{calculateIncome.3}}</td>
                            <td></td>
                            <td>ค่าเอกสาร/เครื่องเขียน</td>
                            <td>{{calculateIncome.5}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><div style="display: flex;">เงินรายได้อื่นๆ<div class="line" style="width: 50%;">สลากธกส.</div></div></td>
                            <td>{{calculateIncome.4}}</td>
                            <td></td>
                            <td>ค่ากิจกรรม/ประชุม</td>
                            <td>{{calculateIncome.6}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><div style="display: flex;">เงินรายได้อื่นๆ<div class="line" style="width: 50%;">ดอกเบี้ยบริหาร</div></div></td>
                            <td>{{calculateIncome.5}}</td>
                            <td></td>
                            <td><div style="display: flex;">รายจ่ายอื่นๆ<div class="line" style="width: 50%;"></div></div></td>
                            <td>{{calculateIncome.7}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="font-weight: 600; text-align: center;">2. รวมรายได้</td>
                            <td>{{calculateIncome.รายได้}}</td>
                            <td></td>
                            <td style="font-weight: 600; text-align: center;">2. รวมค่าใช้จ่าย</td>
                            <td>{{calculateExpense.ค่าใช้จ่าย}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="font-weight: 600;">รวมยอดบัญชีรายรับ</td>
                            <td>{{calculateIncome.รวมรายรับ}}</td>
                            <td></td>
                            <td style="font-weight: 600;">รวมยอดบัญชีรายจ่าย</td>
                            <td>{{calculateExpense.รวมรายจ่าย}}</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="document">
            <div style="margin-top: 20pt; font-weight: 600;">11. การเชื่อมโยงงานสวัสดิการกับงานพัฒนาอื่นๆ มีอะไรบ้าง อย่างไรบ้าง</div>
            <div style="display: flex; margin-left: 15pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="display: flex; width: 90%;"><div style="width: 75%;">องค์กรการเงิน/กลุ่มออมทรัพย์/กองทุนหมู่บ้านคือ</div><div class="line" style="width: 70%;">แก่งเพกา บ้านเกาะอม บ้านทรัพย์สมบูรณ์</div></div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านวิสาหกกิจชุมชน</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านสภาองค์กรชุมชน</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านแผนชุมชน</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านที่ดินทำกินและที่อยู่อาศัย</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านการจัดการทรัพยากรธรรมชาติเเละสิ่งเเวดล้อม</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านเกษตรกรรมยั่งยืน</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านศูนย์การเรียนรู้ท้องถิ่น</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านสุขภาพ/สาธารณสุข</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านการป้องกันเเละเเก้ไขปัญหายาเสพติด</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านอนุรักษ์วัฒนธรรม/ประเพณี/ศาสนา</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">งานด้านเยาวชน/ผู้สูงอายุ/ผู้ด้อยโอกาส</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 10pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">อื่นๆ</div>
                    <div style="display: flex;"><div class="line" style="width: 100%; text-align: start;">-</div></div>
                </div>
            </div>
            <div style="margin-top: 20pt; display: flex;"><p>12. การสนับสนุนจากหน่วยงานต่างๆ</p>(ตอบได้มากกว่า 1 ข้อ ในรอบปี)</div>
            <div style="margin-left: 10pt; margin-top: 10pt;">12.1 การสนันสนุนขององค์กรปกครองส่วนท้องถิ่น (อบจ./อบต./เทศบาล) กับการจัดสวัสดิการชุมชน</div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">สมทบงบประมาณกองทุนสวัสดิการชุมชน</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">สนับสนุนงบประมาณช่วยเหลือการจัดกิจกรรมต่างๆ</div>
                </div>
            </div>
        </div>
        <div class="document">
            <div style="display: flex; margin-left: 15pt; width: 100%; margin-top: 20pt;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">ให้คำปรึกษา/ประสานงาน</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">ให้การสนับสนุนด้านบุคลากร</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">ให้การสนับสนุนสถานที่ดำเนินงาน</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">12.2 การสนับสนุนจากหน่วยงานอื่นๆ</div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">ผู้ว่าราชการจังหวัด</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">พัฒนาสังคมเเละความมั่นคงของมนุษย์จังหวัด</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">สำนักงานพัฒนาชุมชนจังหวัด</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">ศูนย์พัฒนาสังคม (ศพส.)</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">สถาบันพัฒนาองค์กรชุมชน (พอช.)</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">สำนักงานหลักประกันสุขภาพแห่งชาติ (สปสช.)</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">สำนักงคณะกรรมการสุชภาพแห่งชาติ (ส.ช.)</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">สำนักงานกองทุนการสร้างเสริมสุขภาพ (สสส.)</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">มูลนิธิสาธารณสุขแห่งชาติ (มสช.)</div>
                </div>
            </div>
            <div style="display: flex; margin-left: 15pt; width: 100%;">
                <svg style="margin-top: 2pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                    <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                </svg>
                <div style="width: 90%;">
                    <div style="width: 100%; display: flex;">อื่นๆ<div class="line" style="width: 50%;"></div></div>
                </div>
            </div>
            <div style="margin-left: 10pt; margin-top: 10pt;">12.3 ภาคเอกชน</div>
            <div style="margin-left: 15pt; display: flex;">1. <div class="line" style="width: 80%;"></div></div>
            <div style="margin-left: 15pt; display: flex;">2. <div class="line" style="width: 80%;"></div></div>
            <div style="margin-top: 20pt; display: flex; font-weight: 600;">13. มีแผนการพัฒนากองทุนสวัสดิการชุมชน</div>
            <div style="margin-left: 10pt; margin-top: 10pt;">13.1 มีแผนการพัฒนากองทุนสวัสดิการชุมชน</div>
            <div class="executive">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 10%;">ลำดับ</th>
                            <th>แผนงาน/กิจกรรม</th>
                            <th>วิธีการ</th>
                            <th>ผลการดำเนินงาน</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="margin-left: 10pt;">หมายเหตุ : สามารถจัดทำเป็นเอกสารเเนบได้</div>
            <div style="margin-left: 10pt; margin-top: 10pt;">13.2 มีแผนการพัฒนากองทุนสวัสดิการชุมชนร่วมกับองค์กรเเละ/หรือภาคอื่นๆ</div>
            <div class="executive">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 10%;">ลำดับ</th>
                            <th>แผนงาน/กิจกรรม</th>
                            <th>วิธีการ</th>
                            <th>ผลการดำเนินงาน</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="margin-left: 10pt;">หมายเหตุ : สามารถจัดทำเป็นเอกสารเเนบได้</div>
            <div style="margin-left: 10pt; margin-top: 10pt;">13.3 มีแผนการพัฒนากองทุนสวัสดิการชุมชนและริเริ่มการทำแผนด้านสังคม (รอบที่ 3) หรือ มีแผนการพัฒนาด้านสังคม (รอบที่ 4 ขึ้นไป)</div>
            <div class="executive">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 10%;">ลำดับ</th>
                            <th>แผนงาน/กิจกรรม</th>
                            <th>วิธีการ</th>
                            <th>ผลการดำเนินงาน</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="margin-left: 10pt;">หมายเหตุ : สามารถจัดทำเป็นเอกสารเเนบได้</div>
        </div>
        <div class="document">
            <div style="margin-top: 20pt; display: flex; font-weight: 600;">14. ปัญหาอุปสรรคในการดำเนินงาน เเละ เเนวทางเเก้ไข</div>
            <div style="display: flex; width: 100%;"><div style="width: 15%;">ปัญหาอุปสรรค</div><div class="line" style="width: 100%;">-</div></div>
            <div class="line" style="width: 100%;">-</div>
            <div class="line" style="width: 100%;">-</div>
            <div style="display: flex; width: 100%;"><div style="width: 15%;">แนวทางแก้ไข</div><div class="line" style="width: 100%;">-</div></div>
            <div class="line" style="width: 100%;">-</div>
            <div class="line" style="width: 100%;">-</div>
            
            <div style="margin-top: 20pt; display: flex; font-weight: 600;">15. ข้อเสนอเเนะเกี่ยวกับโครงการจัดสวัสดิการชุมชน (ถ้ามี)</div>
            <div class="line" style="width: 100%;">-</div>
            <div class="line" style="width: 100%;">-</div>
            <div class="line" style="width: 100%;">-</div>
            <div class="signed">
                <div style="display: flex; ">
                    ลงชื่อ<div class="line" style="width: 40%;"></div>
                </div>
                <div style="display: flex; ">
                    ( <div class="line"style="width: 40%;">{{usersecretary.firstName}}  {{usersecretary.lastName}}</div> ) ผู้รวบรวมข้อมูล
                </div>
                <div style="display: flex;">
                    ตำเเหน่ง<div class="line" style="width: 40%;">เลขานุการ</div>
                </div>
                <div style="display: flex;">
                    วันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ. <div class="line" style="width: 10%;"></div>
                </div>
            </div>
            <div class="signed">
                <div style="display: flex;">
                    ลงชื่อ<div class="line" style="width: 40%;"></div>
                </div>
                <div style="display: flex; ">
                    ( <div class="line"style="width: 40%;">{{userchairman.firstName}}  {{userchairman.lastName}}</div> ) ประธาน/รองประธานกองทุนระดับตำบล/เทศบาล/เขต
                </div>
                <div style="display: flex;">
                    ตำเเหน่ง<div class="line" style="width: 40%;">ประธานกองทุนสวัสดิการชุมชน</div>
                </div>
                <div style="display: flex;">
                    วันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ. <div class="line" style="width: 10%;"></div>
                </div>
            </div>
            <div class="signed">
                <div style="display: flex;">
                    ลงชื่อ<div class="line" style="width: 40%;"></div>
                </div>
                <div style="display: flex; ">
                    ( <div class="line"style="width: 40%;"></div> ) ผู้รับรองข้อมูลระดับจังหวัด
                </div>
                <div style="display: flex;">
                    ตำเเหน่ง<div class="line" style="width: 40%;"></div>(คณะกรรมการสนับสนุนการขับเคลื่อนฯ จังหวัด)
                </div>
                <div style="display: flex;">
                    วันที่<div class="line" style="width: 10%;"></div>เดือน<div class="line" style="width: 15%;"></div>พ.ศ. <div class="line" style="width: 10%;"></div>
                </div>
            </div>
        </div>
    </body>
</html>