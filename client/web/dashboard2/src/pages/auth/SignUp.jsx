import React, {useState} from 'react'
import { FaLinkedinIn,FaRegEnvelope} from 'react-icons/fa';
import { RiLockPasswordLine } from "react-icons/ri";
import { IoMdContact } from "react-icons/io";
import { CiCalendarDate } from "react-icons/ci";
import { FaSchool } from "react-icons/fa";
import { MdEngineering } from "react-icons/md";


const SignUp = () => {
  const [firstname, setFirstname] = useState("");
  const [lastname, setLastname] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [date, setDate] = useState("");
  const [college, setCollege] = useState("");
  const [field, setField] = useState("");
  const [linkedin, setLinkedin] = useState("");


  return (
    <div className="flex flex-col items-center justify-center min-h-screen py-2 bg-gray-100">
      <main className="flex flex-col justify-center items-center w-full flex-1 px-20 text-center">
        <div className="bg-white rounded-2xl shadow-2xl flex w-2/3 max-w-4xl">
          <div className="w-full p-5">
            <div className="text-left font-bold">
              <span className="text-blue-500">Dev</span>
              <span className="text-black">Net</span>
            </div>

            <div className="py-10">
              <h2 className="text-3xl font-bold text-blue-500 mb-2">
                Create your Account
              </h2>

              <div className="border-2 w-10 border-blue-500 inline-block mb-2"></div>

              <div className="flex flex-col items-center">
              <div className="bg-gray-100 w-64 p-2 flex items-center mb-3 rounded-xl">
                  <IoMdContact className="text-gray-400 m-2" />
                  <input
                    type="text"
                    name="firstname"
                    placeholder="First Name"
                    className="bg-gray-100 outline-none text-sm flex-1"
                    onChange={(e) => setFirstname(e.target.value)}
                  />
                </div>
              <div className="bg-gray-100 w-64 p-2 flex items-center mb-3 rounded-xl">
                  <IoMdContact className="text-gray-400 m-2" />
                  <input
                    type="text"
                    name="lastname"
                    placeholder="Last name"
                    className="bg-gray-100 outline-none text-sm flex-1"
                    onChange={(e) => setLastname(e.target.value)}
                  />
                </div>
                <div className="bg-gray-100 w-64 p-2 flex items-center mb-3 rounded-xl">
                  <FaRegEnvelope className="text-gray-400 m-2" />
                  <input
                    type="email"
                    name="email"
                    placeholder="Email"
                    className="bg-gray-100 outline-none text-sm flex-1"
                    onChange={(e) => setEmail(e.target.value)}
                  />
                </div>

                <div className="bg-gray-100 w-64 p-2 flex items-center mb-3 rounded-xl">
                  <RiLockPasswordLine  className="text-gray-400 m-2" />
                  <input
                    type="password"
                    name="password"
                    placeholder="password"
                    className="bg-gray-100 outline-none text-sm flex-1"
                    onChange={(e) => setPassword(e.target.value)}
                  />
                </div>

                <div className="bg-gray-100 w-64 p-2 flex items-center mb-3 rounded-xl">
                  <CiCalendarDate className="text-gray-400 m-2" />
                  <input
                    type="date"
                    name="date"
                    placeholder="DOB"
                    className="bg-gray-100 outline-none text-sm flex-1"
                    onChange={(e) => setDate(e.target.value)}
                  />
                </div>

                <div className="bg-gray-100 w-64 p-2 flex items-center mb-3 rounded-xl">
                  <FaSchool className="text-gray-400 m-2" />
                  <input
                    type="text"
                    name="text"
                    placeholder="Enter your college"
                    className="bg-gray-100 outline-none text-sm flex-1"
                    onChange={(e) => setCollege(e.target.value)}
                  />
                </div>

                <div className="bg-gray-100 w-64 p-2 flex items-center mb-3 rounded-xl">
                  <MdEngineering className="text-gray-400 m-2" />
                  <input
                    type="text"
                    name="text"
                    placeholder="Enter your field"
                    className="bg-gray-100 outline-none text-sm flex-1"
                    onChange={(e) => setField(e.target.value)}
                  />
                </div>

                <div className="bg-gray-100 w-64 p-2 flex items-center rounded-xl">
                  <FaLinkedinIn className="text-gray-400 m-2" />
                  <input
                    type="url"
                    name="url"
                    placeholder="LinkedIn Url"
                    className="bg-gray-100 outline-none text-sm flex-1"
                    onChange={(e) => setLinkedin(e.target.value)}
                  />
                </div>
                <a
                  href="#"
                  className="border-2 border-blue-500 border-solid text-blue-500 rounded-full px-14 py-2 m-10 inline-block font-bold hover:text-blue-500 hover:bg-white"
                >
                  Create Account
                </a>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}

export default SignUp
