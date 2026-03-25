import { useState, useEffect } from 'react'
import { getHealth, getUsers } from './api.js'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import heroImg from './assets/hero.png'
import './App.css'


function App() {
  const [count, setCount] = useState(0)
  const [health, setHealth] = useState(null)
  const [users, setUsers] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    async function fetchData() {
      try {
        const healthData = await getHealth()
        setHealth(healthData)
        const usersData = await getUsers()
        setUsers(usersData)
      } catch (err) {
        setError(err.message || 'Error fetching data')
      } finally {
        setLoading(false)
      }
    }
    fetchData()
  }, [])


  return (
    <>
      <section id="center">
        <div className="hero">
          <img src={heroImg} className="base" width="170" height="179" alt="" />
          <img src={reactLogo} className="framework" alt="React logo" />
          <img src={viteLogo} className="vite" alt="Vite logo" />
        </div>
        <div>
          <h1>Get started</h1>
          <p>
            Edit <code>src/App.jsx</code> and save to test <code>HMR</code>
          </p>
        </div>
        <button
          className="counter"
          onClick={() => setCount((count) => count + 1)}
        >
          Count is {count}
        </button>
      </section>

      <section style={{ margin: '2rem 0' }}>
        <h2>Backend API Status</h2>
        {loading && <p>Loading...</p>}
        {error && <p style={{ color: 'red' }}>Error: {error}</p>}
        {health && <pre>{JSON.stringify(health, null, 2)}</pre>}
        <h3>Users</h3>
        {users.length === 0 && !loading ? <p>No users found.</p> : null}
        <ul>
          {users.map((user) => (
            <li key={user.id}>{user.name} ({user.email})</li>
          ))}
        </ul>
      </section>

      <div className="ticks"></div>


      <div className="ticks"></div>
      <section id="spacer"></section>
    </>
  )
}

export default App
