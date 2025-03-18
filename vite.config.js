import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'

export default ({ mode }) => {
  process.env = {...process.env, ...loadEnv(mode, process.cwd())};

  return defineConfig({
  plugins: [vue()],
  base: process.env.VITE_BASE_URL, //Set base url in .env for testing purposes
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'),
    },
  },
  build: {
    outDir: 'dist', // Ensures build output goes to 'dist' folder
  },
  assetsInclude: ['**/*.JPG']
})}
