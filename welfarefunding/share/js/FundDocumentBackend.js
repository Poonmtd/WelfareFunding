// const FundDocumentBackend = function(main, parent) {
// 	AbstractPage.call(this, main, parent);

// 	let object = this;
// 	this.title = 'เอกสารกองทุนประจำปี';
// 	this.model = "FundDocument";
// 	this.pageNumber = 1;
// 	this.limit = 10;
// 	this.filter = {};

// 	object.role = ['FundDocument'];
// 	object.restURL = 'welfarefunding/funddocument';

// 	// function syncUp(serverAddress, port, username, password, databaseName, filePath) {
// 	// 	const dumpCommand = `pg_dump -U ${username} -h ${serverAddress} -d ${databaseName} > ${filePath}`;
// 	// 	exec(dumpCommand, (error, stdout, stderr) => {
// 	// 		if (error) {
// 	// 			console.error(`Error: ${error.message}`);
// 	// 			return;
// 	// 		}
// 	// 		if (stderr) {
// 	// 			console.error(`stderr: ${stderr}`);
// 	// 			return;
// 	// 		}
// 	// 		console.log(`Database dumped successfully from server to ${filePath}`);
// 	// 	});
// 	// }

// 	// function syncDown(serverAddress, port, username, password, databaseName, filePath) {
// 	// 	const dumpCommand = `pg_dump -U ${username} -d ${databaseName} > ${filePath}`;
// 	// 	exec(dumpCommand, (error, stdout, stderr) => {
// 	// 		if (error) {
// 	// 			console.error(`Error: ${error.message}`);
// 	// 			return;
// 	// 		}
// 	// 		if (stderr) {
// 	// 			console.error(`stderr: ${stderr}`);
// 	// 			return;
// 	// 		}
// 	// 		const transferCommand = `scp ${filePath} ${username}@${serverAddress}:/path/to/server`;
// 	// 		exec(transferCommand, (error, stdout, stderr) => {
// 	// 			if (error) {
// 	// 				console.error(`Error: ${error.message}`);
// 	// 				return;
// 	// 			}
// 	// 			if (stderr) {
// 	// 				console.error(`stderr: ${stderr}`);
// 	// 				return;
// 	// 			}
// 	// 			console.log(`Database transferred successfully to server`);
// 	// 			const restoreCommand = `psql -U ${username} -d ${databaseName} -f ${filePath}`;
// 	// 			exec(restoreCommand, (error, stdout, stderr) => {
// 	// 				if (error) {
// 	// 					console.error(`Error: ${error.message}`);
// 	// 					return;
// 	// 				}
// 	// 				if (stderr) {
// 	// 					console.error(`stderr: ${stderr}`);
// 	// 					return;
// 	// 				}
// 	// 				console.log(`Database restored successfully on server`);
// 	// 			});
// 	// 		});
// 	// 	});
// 	// }
// 	// const localClient = new Client({
// 	// 	user: 'nattanit',
// 	// 	host: 'DESKTOP-41E83CE',
// 	// 	database: 'welfarefunding',
// 	// 	password: '1234',
// 	// 	port: 8080,
// 	//   });
	  
// 	//   // การตั้งค่าฐานข้อมูลระยะไกล
// 	//   const remoteClient = new Client({
// 	// 	user: 'administrator',
// 	// 	host: 'ximplesoft.com',
// 	// 	database: 'welfare',
// 	// 	password: '11223344',
// 	// 	port: 5432,
// 	//   });

// 	function executeCommand(command) {
// 		const { exec } = require('child_process');
// 		return new Promise((resolve, reject) => {
// 		  exec(command, (error, stdout, stderr) => {
// 			if (error) {
// 			  reject(error);
// 			  return;
// 			}
// 			resolve(stdout.trim());
// 		  });
// 		});
// 	}


// 	this.renderTableView = async function(modelName, config={}){
// 		config.hasAvatar = false;
// 		config.operation = [
// 			{label: 'เอกสารกองทุน', ID: 'pdf', icon: 'welfarefunding.PDF'}
// 			,{label: 'SyncUp s->l', ID: 'syncUp', icon: 'welfarefunding.PDF'}
// 			,{label: 'SyncDown l->s', ID: 'calculate', icon: 'welfarefunding.PDF'}
// 			// {label: 'แบบประสงค์ขอโอน', ID: 'transfer', icon: 'welfarefunding.PDF'},
// 			// {label: 'หนังสือร้องเรียน', ID: 'complaint', icon: 'welfarefunding.PDF'},
// 			// {label: 'แบบเสนอขอรับเงินสนับสนุน', ID: 'requestbudget', icon: 'welfarefunding.PDF'}
// 		]
// 		let table = await AbstractPage.prototype.renderTable.call(this, modelName, config);
// 		for(let i in table.records){
// 			let record = table.records[i];
// 			console.log(record.record);
// 			record.dom.pdf.onclick = async function(){
// 				let blob = await  GET(`welfarefunding/documentfundperyear/by/id/get/${record.record.id}`, undefined, 'blob');
// 				await OPEN_FILE(blob);
// 			}

// 			record.dom.syncUp.onclick = async function(){
// 				try {
// 					// localClient.connect();
// 					// remoteClient.connect();
// 					// Execute the commands for database synchronization
// 					await executeCommand('pg_dump -h ximplesoft.com -U administrator -d welfare -F c -f /path/to/backup/welfareremote.dump');
// 					await executeCommand('scp administrator@ximplesoft.com:/path/to/backup/welfareremote.dump /local/path/to/backup/');
// 					await executeCommand('pg_restore -h DESKTOP-41E83CE -U nattanit -d welfarefunding -c /local/path/to/backup/welfareremote.dump');
		
// 					// Display success message
// 					console.log('Database synchronized successfully!');
// 				} catch (error) {
// 					// Display error message
// 					console.error('Error synchronizing database:', error);
// 				}
// 			}

// 			record.dom.calculate.onclick = async function(){
// 				try {
// 					// Execute the commands for database synchronization
// 					await executeCommand('pg_dump -h DESKTOP-41E83CE -U nattanit -d welfarefunding -F c -f /path/to/backup/welfarelocal.dump');
// 					await executeCommand('scp nattanit@DESKTOP-41E83CE:/path/to/backup/welfarelocal.dump /local/path/to/backup/');
// 					await executeCommand('pg_restore -h ximplesoft.com -U administrator -d welfare -c /local/path/to/backup/welfarelocal.dump');
		
// 					// Display success message
// 					console.log('Database synchronized successfully!');
// 				} catch (error) {
// 					// Display error message
// 					console.error('Error synchronizing database:', error);
// 				}
// 			}

// 			// record.dom.tax.onclick = async function(){
// 			// 	const serverAddress = 'localhost';
// 			// 	const username = 'localhost';
// 			// 	const port = '5432';
// 			// 	const databaseName = 'welfare';
// 			// 	const password = '11223344';
// 			// 	const filePath = '/path/to/backup.sql';
		
// 			// 	// Sync up from server to localhost
// 			// 	await syncUp(serverAddress, port, username, password, databaseName, filePath);
// 			// }
// 			// record.dom.calculate.onclick = async function(){
// 			// 	const serverAddress = 'localhost';
// 			// 	const username = 'username';
// 			// 	const port = '5432';
// 			// 	const databaseName = 'nagauser';
// 			// 	const password = '11223344';
// 			// 	const filePath = '/path/to/backup.sql';
		
// 			// 	// Sync up from server to localhost
// 			// 	await syncDown(serverAddress, port, username, password, databaseName, filePath);
// 			// }
// 			// record.dom.transfer.onclick = async function(){
// 			// 	let blob = await GET(`welfarefunding/transferrequestform/by/id/get/${record.record.id}`, undefined, 'blob');
// 			// 	await OPEN_FILE(blob);
// 			// }
// 			// record.dom.complaint.onclick = async function(){
// 			// 	let blob = await GET(`welfarefunding/complaintletter/by/id/get/${record.record.id}`, undefined, 'blob');
// 			// 	await OPEN_FILE(blob);
// 			// }
// 			// record.dom.requestbudget.onclick = async function(){
// 			// 	let blob = await GET(`welfarefunding/requestbudget/by/id/get/${record.record.id}`, undefined, 'blob')
// 			// 	await OPEN_FILE(blob);
// 			// }
// 		}
// 	}
// }

const FundDocumentBackend = function(main, parent) {
    AbstractPage.call(this, main, parent);

    let object = this;
    this.title = 'เอกสารกองทุนประจำปี';
    this.model = "FundDocument";
    this.pageNumber = 1;
    this.limit = 10;
    this.filter = {};

    object.role = ['FundDocument'];
    object.restURL = 'welfarefunding/funddocument';

    this.renderTableView = async function(modelName, config = {}) {
        config.hasAvatar = false;
        config.operation = [
            { label: 'เอกสารกองทุน', ID: 'pdf', icon: 'welfarefunding.PDF' },
            // { label: 'SyncUp s->l', ID: 'syncUp', icon: 'welfarefunding.PDF' },
            { label: 'SyncDown l->s', ID: 'calculate', icon: 'welfarefunding.PDF' }
        ];
        let table = await AbstractPage.prototype.renderTable.call(this, modelName, config);
        for (let i in table.records) {
            let record = table.records[i];
            console.log(record.record);
            record.dom.pdf.onclick = async function() {
                let blob = await GET(`welfarefunding/documentfundperyear/by/id/get/${record.record.id}`, undefined, 'blob');
                await OPEN_FILE(blob);
            };

            // record.dom.syncUp.onclick = async function() {
            //     try {
            //         let response = await fetch('/sync-up', { method: 'POST' });
            //         let result = await response.json();
            //         if (response.ok) {
            //             console.log(result.message);
            //         } else {
            //             console.error(result.error);
            //         }
            //     } catch (error) {
            //         console.error('Error synchronizing database:', error);
            //     }
            // };

            record.dom.calculate.onclick = async function() {
                try {
                    const backupCommand = 'sudo -u postgres pg_dump welfarefunding > welfarefunding.sql';
    
					// Step 2: Copy the backup file to a remote server
					const scpCommand = 'sudo scp welfarefunding.sql administrator@ximplesoft.com:Projects/WelfareFunding';

					// Step 3: Restore the database from the backup
					const restoreCommand = 'sudo -u postgres psql -d welfare -f welfarefunding.sql';

					// Execute the commands sequentially
					const { exec } = require('child_process');

					// Backup the database
					exec(backupCommand, (error1, stdout1, stderr1) => {
						if (error1) {
							console.error(`Error backing up database: ${error1.message}`);
							return;
						}
						console.log(`Backup stdout: ${stdout1}`);
						console.error(`Backup stderr: ${stderr1}`);
						
						// Copy the backup file
						exec(scpCommand, {stdio: 'inherit'}, (error2, stdout2, stderr2) => {
							if (error2) {
								console.error(`Error copying file: ${error2.message}`);
								return;
							}
							console.log(`SCP stdout: ${stdout2}`);
							console.error(`SCP stderr: ${stderr2}`);
							
							// Restore the database
							exec(restoreCommand, (error3, stdout3, stderr3) => {
								if (error3) {
									console.error(`Error restoring database: ${error3.message}`);
									return;
								}
								console.log(`Restore stdout: ${stdout3}`);
								console.error(`Restore stderr: ${stderr3}`);
							});
						});
					});
                } catch (error) {
                    console.error('Error synchronizing database:', error);
                }
            };
        }
    };
};
