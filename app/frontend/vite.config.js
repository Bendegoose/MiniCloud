import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '')

  return {
    plugins: [react()],
    server: {
      watch: {
        usePolling: true,
        interval: 1000
      },
      proxy: {
        '/api': {
          target: env.VITE_API_URL,
          changeOrigin: true
        },
        '/health': {
          target: env.VITE_API_URL,
          changeOrigin: true
        }
      }
    }
  }
})