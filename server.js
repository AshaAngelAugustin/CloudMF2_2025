const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post('/convert', (req, res) => {
  // Dummy response for testing
  res.json({
    message: 'Conversion complete.',
    content: 'Sample converted file content.',
    outputFileName: 'converted_output.txt'
  });
});

app.listen(3001, () => console.log('Server running on port 3001'));