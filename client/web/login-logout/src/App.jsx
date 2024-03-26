import { useState } from 'react'
import './App.css'

function App() {

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  
  return (
    <div className='main'>
      <h1>Login</h1>
      <form className='signup-form'>
        <input 
          type="email" 
          placeholder="Email" 
          required
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />

        <input 
          type="password" 
          placeholder="Password" 
          required
          value={password}
          onChange={(e) => setEmail(e.target.value)}
        />

        <button className='submit-btn' onClick={login}>
          Login
        </button>
      </form>
    </div>
  )
}

export default App
