<script>
    import Navbar from '../lib/components/Navbar.svelte';
    import '../global.css'
</script>

<style>
    header {
        width: 100vw;
        max-width: 1200px;
        margin-bottom: 5rem;
    }

    @media (min-width: 1280) {
        header {
            width: 100%;
        }
    }

    main {
        width: 100%;
        max-width: 1200px;
    }

    footer {
        margin-top: 5rem;
        user-select: text;
    }

    footer p {
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-weight: 500;
        font-size: 0.9rem;
    }
</style>

<header>
    <Navbar />
</header>
<main>
    <slot></slot>
</main>
<footer>
    <p>© 2024 Matt Kajdan - MK Studio</p>
</footer>