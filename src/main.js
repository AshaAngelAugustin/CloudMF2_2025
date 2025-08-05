import './simple-style.css'

document.querySelector('#app').innerHTML = `
  <div class="container">
    <h1>Database Converter</h1>
    <p>Convert your database files to different formats</p>
    
    <div class="form-group">
      <label for="fileInput">Select File:</label>
      <input type="file" id="fileInput" accept=".txt,.sql,.csv">
    </div>
    
    <div class="form-group">
      <label for="databaseSelect">Convert to:</label>
      <select id="databaseSelect">
        <option value="">Select Database Type</option>
        <option value="oracle">Oracle</option>
        <option value="sqlserver">SQL Server</option>
        <option value="sybase">Sybase</option>
      </select>
    </div>
    
    <button id="convertBtn">Convert File</button>
    
    <div id="result" class="result">
      <h3>Conversion Result:</h3>
      <p id="resultText"></p>
      <button id="downloadBtn">Download Converted File</button>
    </div>
  </div>
`;

let convertedContent = '';
let originalFileName = '';

document.getElementById('convertBtn').addEventListener('click', function() {
  const fileInput = document.getElementById('fileInput');
  const databaseSelect = document.getElementById('databaseSelect');
  const result = document.getElementById('result');
  const resultText = document.getElementById('resultText');
  
  if (!fileInput.files[0]) {
    alert('Please select a file');
    return;
  }
  
  if (!databaseSelect.value) {
    alert('Please select a database type');
    return;
  }
  
  const file = fileInput.files[0];
  originalFileName = file.name;
  const reader = new FileReader();
  
  reader.onload = function(e) {
    const content = e.target.result;
    const targetDB = databaseSelect.value;
    
    convertedContent = performConversion(content, targetDB);
    
    resultText.textContent = `File converted to ${targetDB.toUpperCase()} format successfully!`;
    result.style.display = 'block';
  };
  
  reader.readAsText(file);
});

document.getElementById('downloadBtn').addEventListener('click', function() {
  const databaseSelect = document.getElementById('databaseSelect');
  const targetDB = databaseSelect.value;
  const fileName = originalFileName.replace(/\.[^/.]+$/, '') + '_' + targetDB + '.sql';
  
  const blob = new Blob([convertedContent], { type: 'text/plain' });
  const url = window.URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = fileName;
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  window.URL.revokeObjectURL(url);
});

function performConversion(content, targetDB) {
  let converted = content;
  
  if (targetDB === 'oracle') {
    converted = content.replace(/VARCHAR\(/g, 'VARCHAR2(');
    converted = converted.replace(/GETDATE\(\)/g, 'SYSDATE');
  } else if (targetDB === 'sqlserver') {
    converted = content.replace(/VARCHAR2\(/g, 'VARCHAR(');
    converted = converted.replace(/SYSDATE/g, 'GETDATE()');
  } else if (targetDB === 'sybase') {
    converted = content.replace(/VARCHAR2\(/g, 'VARCHAR(');
    converted = converted.replace(/SYSDATE/g, 'GETDATE()');
  }
  
  return converted;
}
