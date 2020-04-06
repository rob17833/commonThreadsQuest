// the first thing I need? express !
const express = require('express');
const bodyParser = require('body-parser');
const connection = require('./config.js');

const port = 3000;
const app = express();

// allow bodyParser to retrieve JSON format

app.use(bodyParser.json());
// allow bodyParser to retrieve x-www-form-urlencoded
app.use(bodyParser.urlencoded({
  extended: true,
}));

// 1 retrieve all the students
app.get('/api/students-all', (req, res) => {
  connection.query('select * from students where students.deleted=false', (err, results) => {
    if (err) {
      res.status(500).send('error while retrieving students');
    } else {
      res.status(200).json(results);
    }
  });
});

// 2 retrieve students that paid their contribution or not
app.get('/api/student-contrib/', (req, res) => {
  const student = req.query.contribution;
  connection.query('select * from students where contribution= ?', student, (err, results)=>{
    if (err) {
      res.status(404).send('error while retrieving data');
    } else {
      res.status(200).json(results);
    }
  });
});

// returns all the students that work on the project mentioned
app.get('/api/project-student', (req, res) => {
  const project = `%${req.query.project}%`;
  connection.query(`SELECT \
    students.first_name,\
    students.last_name, \
    student_projects.title  
    FROM \
    students, \
    students_has_student_projects, \
    student_projects 
    where \
    students.id=students_has_student_projects.students_id \
    AND students_has_student_projects.student_projects_id=student_projects.id \
    AND student_projects.title LIKE ?`, project, (err, results) => {
    if (err) {
      res.status(404).send('error while retrieving data');
    } else {
      res.status(200).json(results);
    }
  });
});

// returns the coachs names that start with ..., Pamela or Domingo or Roland or Daniela
app.get('/api/coachs/', (req, res) => {
  const coach = `%${req.query.coach}%`;
  connection.query('SELECT * FROM coachs WHERE coachs.name LIKE ?', coach, (err, results) => {
    if (err) {
      res.status(404).send('error while retrieving data');
    } else {
      res.status(200).json(results);
    }
  });
});

// enter a bith date to select students
app.get('/api/students-birth-date', (req, res) => {
  const birthDate = req.query.birthdate;
  connection.query('select * from students where students.birthdate> ?', birthDate, (err, results) => {
    if (err) {
      res.status(404).send('error while retrieving data');
    } else {
      res.status(200).json(results);
    }
  });
});

// returns exams grades ordered by what's been passed as params
app.get('/api/grades/:order', (req, res) => {
  const { order } = req.params;
  connection.query(`select \
    student_grades.id,\
    first_name, \
    last_name, \
    test, \
    student_id, \
    Comments, \
    grade \
    from \
    students \
    JOIN \
    student_grades ON students.id = student_grades.student_id \
    ORDER BY student_grades.grade ${order}`, (err, results) => {
    if (err) {
      res.status(404).send('error while retrieving data');
    } else {
      res.status(200).json(results);
    }
  });
});

// insert of a new entity
app.post('/api/new-student', (req, res) => {
  const studentData = req.body;
  connection.query('insert into students set ?', studentData, (err) => {
    if (err) {
      res.status(500).send('error while sending data');
    } else {
      res.status(200).send('successfully sent');
    }
  });
});

// modification of an entity, change the name of a coach
app.put('/api/update-coach-name/:id', (req, res) => {
  const coachName = req.body;
  const coachId = req.params.id;
  connection.query('update coachs set ? where idcoachs =?', [coachName, coachId], (err) => {
    if (err) {
      res.status(404).send('error while updating data');
    } else {
      res.status(200).send('successfully updated');
    }
  });
});

// toogle a boolean value
app.put('/api/swicht-contrib/:id/:bool', (req, res) => {
  const student = req.params.id;
  const contrib = req.params.bool;
  connection.query('update students set contribution= ? where students.id = ?', [contrib, student], (err, results) => {
    if (err) {
      res.status(404).send(err);
    } else {
      res.status(200).send(results);
    }
  });
});

// delete an entity
app.delete('/api/delete-coach/:id', (req, res) => {
  const coach = req.params.id;
  connection.query('delete from coachs where coach.idcoachs=?', coach, (err, results) => {
    if (err) {
      res.status(404).send('error while deleting data');
    } else {
      res.status(200).json(results);
    }
  });
});

// delete all entities where boolean values is false
app.delete('/api/delete-all/', (req, res) => {
  connection.query('delete from students where students.contribution=false', (err) => {
    if (err) {
      res.status(404).send('error while retrieving data');
    } else {
      res.status(200).send('successfully updated');
    }
  });
});


app.listen(port, (err) => {
  if (err) {
    console.log('something bad happened');
  } else {
    console.log(`listening to port: ${port}`);
  }
});
