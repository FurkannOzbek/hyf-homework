// We are getting also directories in process.argv, so I avoid the directories by slice
const args = process.argv.slice(2);
const isNumber = (arg) => !isNaN(arg);
if (args.length === 0) {
  console.log("Please provide variables");
} else if (args.every(isNumber)) {
  let total = 0;
  let avarage = 0;
  for (let i = 0; i < args.length; i++) {
    total = total + parseInt(args[i]);
  }
  avarage = total / args.length;
  console.log(avarage);
} else {
  console.log("Please make sure all inputs are numbers");
}
