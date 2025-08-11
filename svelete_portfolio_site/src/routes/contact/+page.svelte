<script>
    import Project from '../../lib/components/Project.svelte';
</script>

<style>
    #contact {
        display: flex;
        /* flex-direction: row; */
        align-items: center;
        justify-content: center;
        gap: 2rem;
        height: calc(100vh - 19.5rem);
    }
    .title {
        margin-bottom: 0;
        text-align: center;
    }

    .subtitle {
        font-size: 1.2rem;
        text-align: center;
    }
    .email-icon {
        fill: currentColor;
    }

    #contact-card {
        display: flex;
        align-items: center;
        gap: 1rem;
        border-radius: 2rem;
        background-color: var(--primary);
        color: var(--background);
        box-shadow: var(--def-shadow);
    }

    #contact-card:hover{
        box-shadow: var(--hov-shadow);
    }

    #contact-card svg {
        fill: var(--background);
    }

    #contact-card strong {
        font-family: 'Plus Jakarta Sans', sans-serif; /* Font for headings */
        font-weight: 600;
        font-size: 1.2rem;
    }
    #contact-card a {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 1rem;
        width: 100%;
        height: 100%;
        cursor: pointer;
        padding: 2rem 3rem;
    }

</style>

<main id="contact">
    <div id="text">
        <h1 class="title">Contact</h1>
        <p class="subtitle">If you are interested in collaboration,<br>feel free to contact me via email.</p>
    </div>
    <div id="contact-card">
        <a href="mailto:mt.kajdan@gmail.com">
            <svg class="email-icon" height="2rem" width="2rem" xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" fill="#e8eaed"><path d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h640q33 0 56.5 23.5T880-720v480q0 33-23.5 56.5T800-160H160Zm320-280L160-640v400h640v-400L480-440Zm0-80 320-200H160l320 200ZM160-640v-80 480-400Z"/></svg>
            <strong>mt.kajdan@gmail.com</strong>
        </a>
    </div>
</main>